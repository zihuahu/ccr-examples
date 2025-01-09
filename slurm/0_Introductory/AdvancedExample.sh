#!/bin/bash -l

#SBATCH --cluster=[cluster]                        #Select the appropriate cluster from the README.md placeholders
#SBATCH --partition=[partition]                    #Select the appropriate partition from the placeholders
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]
#SBATCH --time=00:01:00                            #Job runtime limit. Exceeding this cancel the job. Format: dd:hh:mm:ss
#SBATCH --nodes=1                                  
#SBATCH --ntasks=1                                 #Refer our documentation provided in the README.md for more info on this
#SBATCH --cpus-per-task=32  
#SBATCH --mem=20G                                  #Default units are megabytes. Different units can be specified using the suffix [K|M|G|T]
#SBATCH --job-name="example-debug-job"             #Give your job a name
#SBATCH --output=example-debug-job.out             #Tell slurm the name of the file to write to
#SBATCH --mail-user=myemailaddress@institution.edu
#SBATCH --mail-type=[MailType]                     #Tell slurm the types of emails to send.

echo "Testing submitting a job for [CCRUsername]"
