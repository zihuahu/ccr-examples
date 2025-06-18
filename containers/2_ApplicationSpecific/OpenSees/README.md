# Example OpenSees container

Please Note: Graphical output will only display in an [OnDemand portal](https://ondemand.ccr.buffalo.edu) session

## Building the container

A brief guide to building the OpenSees container follows:<br/>
Please refer to CCR's [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more detailed information on building and using Apptainer.

1. Start an interactive job

Apptainer is not available on the CCR login nodes and the compile nodes may not provide enough resources for you to build a container.  We recommend requesting an interactive job on a compute node to conduct this build process.<br/>
See CCR docs for more info on [running jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission)

```
salloc --cluster=ub-hpc --partition=debug --qos=debug --mem=64GB --time=01:00:00
```

sample outout:

> ```
> salloc: Pending job allocation 19781052
> salloc: job 19781052 queued and waiting for resources
> salloc: job 19781052 has been allocated resources
> salloc: Granted job allocation 19781052
> salloc: Nodes cpn-i14-39 are ready for job
> CCRusername@cpn-i14-39:~$ 
> ```

2. Navigate to your build directory and use the Slurm job local temporary directory for cache

You should now be on the compute node allocated to you.  In this example we're using our project directory for our build directory.  Ensure you've placed your `OpenSees.def` file in your build directory

```
cd /projects/academic/[YourGroupName]/[CCRusername]
export APPTAINER_CACHEDIR=${SLURMTMPDIR}

```

3. Build your container

```
apptainer build OpenSees-$(arch).sif OpenSees.def
```

sample truncated output:

> ```
> [....]
> INFO:    Adding environment to container
> INFO:    Creating SIF file...
> INFO:    Build complete: OpenSees.def-x86_64.sif
> ```

## Running the container

Start an interactive job e.g.

```
salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=128GB --nodes=1 --cpus-per-task=1 --tasks-per-node=32 --time=05:00:00
```

...then run the container


```
cd /projects/academic/[YourGroupName]/[CCRusername]
apptainer shell -B /util:/util,/scratch:/scratch,/projects:/projects OpenSees-$(arch).sif 
Apptainer> OpenSees


         OpenSees -- Open System For Earthquake Engineering Simulation
                 Pacific Earthquake Engineering Research Center
                        Version 3.7.2 64-Bit

      (c) Copyright 1999-2016 The Regents of the University of California
                              All Rights Reserved
  (Copyright and Disclaimer @ http://www.berkeley.edu/OpenSees/copyright.html)


OpenSees > 
```

## Parallel OpenSees

Parallel MPI jobs can be run with OpenSeesSP or OpenSeesMP

|   |   |
|---|---|
| OpenSeesSP | For Performing analysis of very large models. |
| OpenSeesMP | For Performing parameter studies or analysis of large models with user defined partitions |


Parallel Slurm script examples (X86_64):

[OpenSeesSP with "srun"](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_OpenSeesSP_example.bash)  
[OpenSeesSP with "mpirun"](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_OpenSeesSP_mpirun_example.bash)

[OpenSeesMP with "srun"](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_OpenSeesMP_example.bash)  
[OpenSeesMP with "mpirun"](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_OpenSeesMP_mpirun_example.bash)

Parallel ARM64 Slurm script examples:

[OpenSeesSP](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_ARM64_OpenSeesSP_example.bash)  
[OpenSeesMP](https://raw.githubusercontent.com/tonykew/ccr-examples/refs/heads/OpenSees/containers/2_ApplicationSpecific/OpenSees/slurm_ARM64_OpenSeesMP_example.bash)


See the [OpenSees Documentation](https://opensees.github.io/OpenSeesDocumentation) website and the [OpenSees Parallel](https://opensees.berkeley.edu/OpenSees/parallel/parallel.php) website for more info on OpenSees  
For the Python documentation see the [OpenSeesPy](https://openseespydoc.readthedocs.io) website

