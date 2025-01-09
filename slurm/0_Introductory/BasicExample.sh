#!/bin/bash -l

##Select the appropriate cluster from the README.md placeholders
#SBATCH --cluster=[cluster]

##Select the appropriate partition from the placeholders							
#SBATCH --partition=[partition]

##qos is generally same as [partition]
#SBATCH --qos=[qos]

##Job runtime limit. Exceeding this cancels the job. Format: dd:hh:mm:ss
#SBATCH --time=00:01:00

##Number of "tasks" (for parallelism). Refer our documentation provided in the README.md for more info on this.
#SBATCH --ntasks=1

##Specify real memory required per node. Default units are megabytes.
#SBATCH --mem=20G
