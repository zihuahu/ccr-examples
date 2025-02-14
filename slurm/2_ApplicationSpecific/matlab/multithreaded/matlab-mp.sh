#!/bin/bash -l
#SBATCH --job-name=matlab-mp                    # create a short name for your job
#SBATCH --qos=general-compute                   # qos job will run under 
#SBATCH --partition=general-compute             # partition to run on 
#SBATCH --nodes=1                               # node count
#SBATCH --ntasks=1                              # total number of tasks across all nodes
#SBATCH --cpus-per-task=4                       # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G                        # memory per cpu-core (4G per cpu-core is default)
#SBATCH --time=00:01:00                         # total run time limit (HH:MM:SS)
#SBATCH --mail-type=all                         # send email on job start, end and fault
#SBATCH --mail-user=UBITusername@buffalo.edu      # valid email for Slurm to send notifications

module load matlab/2023b

matlab -nodisplay -nosplash -r for_loop
