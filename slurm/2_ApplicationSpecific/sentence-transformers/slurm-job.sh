#!/bin/bash -l

##   This file is intended to serve as a template to be downloaded and modified for your use case.
##   For more information, refer to the following resources whenever referenced in the script-
##   README- https://github.com/ubccr/ccr-examples/tree/main/slurm/2_ApplicationSpecific/README.md
##   DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs
##   GPU DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/software/modules/#alphafold (Needs to be updated)

##   Select a cluster, partition, qos and account that is appropriate for your use case
##   Available options and more details are provided in README
#SBATCH --cluster=[cluster]
#SBATCH --partition=[partition]
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]

##   Job runtime limit, the job will be canceled once this limit is reached. Format- dd:hh:mm
#SBATCH --time=01:00:00

##   Refer to DOCUMENTATION for details on the next two directives

##   Specify the number of tasks (for parallelism)
#SBATCH --ntasks=1

##   Allocate CPUs per task
#SBATCH --cpus-per-task=32

##   Specify real memory required per node. Default units are megabytes
#SBATCH --mem=64000

##   (CCR Staff: Need information here.) Refer to GPU DOCUMENTATION for more details
#SBATCH --gres=gpu:1

##   By default data is cached in your homedir. Set this to cache data
##   in your project space or scratch space:
export TORCH_HOME=$SLURMTMPDIR/cache/torch

module load foss sentence-transformers
srun python3 evaluation_stsbenchmark.py
