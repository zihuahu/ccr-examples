A brief guide to building the seurat container for scRNA analysis follows:
Please refer to CCR's container documentation for more detailed information on building and using Apptainer.

1. Start an interactive job
=======
# An example Seurat Container with scRNA analysis
# Building the container

Apptainer is not available on the CCR login nodes and the compile nodes may not provide enough resources for you to build a container.
We recommend requesting an interactive job on a compute node to conduct this build process.

CCRusername@cpn-h23-04:~$ salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=32GB --t                                  >
salloc: Granted job allocation 20821331
salloc: Nodes cpn-q08-28-02 are ready for job

2. Navigate to your build directory & set a temp directory for cache

CCRusername@cpn-h23-04:~$ cd /projects/academic/[YourGroupName]/[CCRusername]
CCRusername@cpn-h23-04:/projects/academic/[YourGroupName]/[CCRusername]$ mkdir cache
CCRusername@cpn-h23-04:/projects/academic/[YourGroupName]/[CCRusername]$ export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRusername]/cache

CCRusername@cpn-h23-04:/projects/academic/[YourGroupName]/[CCRusername]$ apptainer build seurat-$(arch).sif deurat.def
INFO:    The %post section will be run under the fakeroot command
INFO:    Starting build...
INFO:    Fetching OCI image..
..............
INFO:    Creating SIF file...
[========
INFO:    Build complete: seurat-x86_64.sif

3. Running the container
# Start an interactive job e.g.
$ salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=128GB --nodes=1 --cpus-per-task=1 --tasks-per-node=32 --time=08:00:00

# run seurat contaner
CCRusername@cpn-h23-04:/projects/academic/[YourGroupName]/[CCRusername]$ apptainer shell seurat-x86_64.sif
Apptainer>

# run example_scRNA_seurat.R

Apptainer> R < example_scRNA_seurat.R --no-save
