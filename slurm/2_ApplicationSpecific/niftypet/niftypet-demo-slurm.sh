#!/bin/bash -l

##   This file is intended to serve as a template to be downloaded and modified for your use case.
##   For more information, refer to the following resources whenever referenced in the script-
##   README-https://github.com/ubccr/ccr-examples/tree/main/slurm/2_Applications/matlab/README.md
##   DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs

##   Select a cluster, partition, qos and account that is appropriate for your use case
##   Available options and more details are provided in README
#SBATCH --cluster=[cluster]
#SBATCH --partition=[partition]
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]

##   Job runtime limit. Format- dd:hh:mm
#SBATCH --time=00:01:00

##   Refer to DOCUMENTATION for details on the next four directives

##   Number of nodes
#SBATCH --nodes=1

##   Specify the number of tasks (for parallelism)
#SBATCH --ntasks=1

##   Number of tasks per node (use with distributed parallelism
#SBATCH --ntasks-per-node=1

##   Allocate CPUs per task
#SBATCH --cpus-per-task=1

##   Memory per cpu-core (4G per cpu-core is default)
#SBATCH --mem-per-cpu=4G

##   Number of gpus per node. Refer to snodes output for breakdown of node capabilities
#SBATCH --gpus-per-node=1

module load foss niftypet ipython

##   Optionally remove ~/.niftypet. This just ensures NiftyPET re-generates
##   resources.py.
rm -rf $HOME/.niftypet/

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

##   NOTE: if you require the proprietary hardware mu-maps and have to be obtained
##   them from Siemens Biograph mMR scanner, you can set this env variable:
##   export HMUDIR=/path/to/mmr_hardware_mumaps

##   Execute NiftyPET demo notebook from the command line.
##   See here: https://niftypet.readthedocs.io/en/latest/tutorials/demo/

##   NOTE: The demo.ipynb has been modified slightly to not use the hardware
##   mu-maps per:
##   https://github.com/NiftyPET/NiftyPET/issues/4#issuecomment-12020906693

##   This will execute demo.ipynb and save the results to a new notebook 
##   named: demo.nbconvert.ipynb
srun jupyter nbconvert --execute --to notebook demo.ipynb
