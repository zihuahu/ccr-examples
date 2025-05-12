
##  Select partition and qos
#SBATCH --partition=general-compute
#SBATCH --qos=general-compute

##  Job runtime limit. Format- dd:hh:mm
#SBATCH --time=3:00:00

##   Number of nodes
#SBATCH --nodes=1

##   Specify the number of tasks (for parallelism)
#SBATCH --ntasks-per-node=1

##   Allocate CPUs per task (>1 if multi-threaded tasks)
#SBATCH --cpus-per-task=1

##   Memory per cpu-core (4G per cpu-core is default)
#SBATCH --mem-per-cpu=4G

#SBATCH --job-name="R"

##   Send email on job start, end, fault and a Valid email for Slurm to send notifications - "mail-user"
#SBATCH --mail-type=all
#SBATCH --mail-user=UBITusername@buffalo.edu

##  Load module R and bioconductor for edgeR library
module load gcc/11.2.0 openmpi/4.1.1 r/4.2.0 r-bundle-bioconductor/3.15-R-4.2.0

##  Run R script. The following is one of a few ways to launch R scripts
R < ex.edgeR --no-save

echo "All done!"

