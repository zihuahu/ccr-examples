#!/bin/bash -l

##   This file is intended to serve as a template to be downloaded and modified for your use case.
##   For more information, refer to the following resources whenever referenced in the script-
##   README- https://github.com/ubccr/ccr-examples/tree/main/slurm/2_Applications/README.md
##   DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs
##   SLURM DIRECTIVES- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#slurm-directives-partitions-qos

##   Select a cluster, partition, qos and account that is appropriate for your use case
##   Available options and more details are provided in README
#SBATCH --cluster=[cluster]
#SBATCH --partition=[partition]
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]

##   Job runtime limit. Format- dd:hh:mm
#SBATCH --time=00:01:00

##   Refer to DOCUMENTATION for details on the next three directives

##   Number of nodes
#SBATCH --nodes=1

##   Specify the number of tasks (for parallelism)
#SBATCH --ntasks=1

##   Allocate CPUs per task
#SBATCH --cpus-per-task=1

##   Specify real memory required per node. Default units are megabytes
#SBATCH --mem=12G

##   Number of gpus per node. Refer to snodes output for breakdown of node capabilities.
##   For additional GPU request options refer to SLURM DIRECTIVES 
#SBATCH --gpus-per-node=2

module load foss pytorch transformers

echo "START TIME: $(date)"

##   Set this to some place in your projects space. Defaults to scratch
hf_cache_dir=$SLURMTMPDIR

##   Define huggingface cache directories to avoid going over quota in $HOME
export TRANSFORMERS_CACHE=$hf_cache_dir/models
export HF_DATASETS_CACHE=$hf_cache_dir/datasets
export HF_MODULES_CACHE=$hf_cache_dir/modules
export HF_METRICS_CACHE=$hf_cache_dir/metrics

MASTER_ADDR=$(scontrol show hostnames $SLURM_JOB_NODELIST | head -n 1)

export LAUNCHER="python3 -m torch.distributed.run \
    --nproc_per_node $SLURM_GPUS_PER_NODE \
    --nnodes $SLURM_NNODES \
    --rdzv_id=$SLURM_JOB_ID \
    --rdzv_backend=static \
    --master_addr=$MASTER_ADDR \
    --max_restarts=0 \
    --tee 3 \
    "

export CMD=" \
    `pwd`/run_clm.py \
    --model_name_or_path gpt2 \
    --dataset_name wikitext \
    --dataset_config_name wikitext-2-raw-v1 \
    --do_train \
    --output_dir `pwd`/output \
    --per_device_train_batch_size 4 \
    --max_steps 200
    "

SRUN_ARGS=" \
    --wait=60 \
    --kill-on-bad-exit=1 \
    "

srun $SRUN_ARGS --jobid $SLURM_JOB_ID bash -c "$LAUNCHER --node_rank \$SLURM_PROCID $CMD"

echo "END TIME: $(date)"
