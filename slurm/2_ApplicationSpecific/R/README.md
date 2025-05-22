Provided is an example R Slurm batch job (R_01.sh), including an R script (ex.edgeR) for differential gene expression analysis, and an example RNA-seq data matrix from 36 samples(edgeR_input.txt) for testing..

To run the R script, put the 3 files in the same directory and simply submit the job to the scheduler from a login node with the following command:

$  sbatch R_01.sh

The results are three files: R_DEG.txt (file showing differentially expressed genes), R_CPM.txt (normalized count per million), and R_plot.eps (figures for the input data).

