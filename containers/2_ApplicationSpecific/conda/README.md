# Example conda container  

CCR does not support running Anaconda on its HPC systems natively for [these reasons](https://docs.ccr.buffalo.edu/en/latest/software/modules/#anaconda-python).  We realize many applications are available only via conda so, as an alternative, users can utilize conda in an Apptainer container.  Utilizing a container for conda eliminates many of the problems it creates on our systems.  This is not a perfect solution though and does require some technical expertise on the part of you, the CCR user.  We provide this information as an example only.  You can modify this to meet your needs.  However, we do not provide support for Anaconda applications.  Any issues you may encounter will need to be worked out on your own.  

## Building the container  

Please refer to CCR's [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for information on building and using Apptainer.  This example provides an Apptainer definition file (`conda.def`) which provides Apptainer a list of packages to install in an Ubuntu container environment.  It also provides an environment file (`environment.yml`) that's used to install packages after the container is built.  For most use cases, you will only need to modify the `environment.yml` file where you'll add additional Python and conda packages to install in your environment. This example utilizes the [conda-forge environment](https://conda-forge.org/) to align with the most recent appropriate use license guidance from Anaconda. 

1. Start an interactive job

Apptainer is not available on the CCR login nodes and the compile nodes may not provide enough resources for you to build a container.  We recommend requesting an interactive job on a compute node to conduct this build process.  This will allow you to test your build after completion as well.  Please refer to our documentation on [running jobs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) for more information.  This is provide as an example only and not all users will have access to the resources in this example:  

```
$ salloc --cluster=ub-hpc --partition=general-compute --qos=general-compute --mem=32GB --time=02:00:00
salloc: Pending job allocation 19319338
salloc: job 19319338 queued and waiting for resources
salloc: job 19319338 has been allocated resources
salloc: Granted job allocation 19319338
salloc: Nodes cpn-h23-04 are ready for job
CCRusername@cpn-h23-04:~$

```

2. Navigate to your build directory & set a temp directory for cache  

You should now be on the compute node allocated to you.  In this example we're using our project directory for our build directory. Ensure you've placed your `conda.def` and `environment.yml` file in your build directory  

```
CCRusername@cpn-h23-04:~$ cd /projects/academic/[YourGroupName]/[CCRusername]  
CCRusername@cpn-h23-04:~$ mkdir cache  
CCRusername@cpn-h23-04:~$ export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRusername]/cache  

```


3. Build your container  

```
CCRusername@cpn-h23-04:~$ apptainer build conda.sif conda.def
...
...
INFO:    Adding environment to container
INFO:    Creating SIF file...
INFO:    Build complete: conda.sif
```

## Running the container  

For our example, we added `busco` to the end of our `environment.yml` file to demonstrate installing a package in the conda environment.  Now let's test it.  You can run the `busco` software simply by specifying the container and the `busco` package name as shown here:  

```
CCRusername@cpn-h23-04:~$ apptainer run conda.sif busco

usage: busco -i [SEQUENCE_FILE] -l [LINEAGE] -o [OUTPUT_NAME] -m [MODE] [OTHER OPTIONS]

```

Alternatively, you can run the `busco` application by first getting shell access to the container, as shown here:  

```
CCRusername@cpn-h23-04:~$ apptainer shell conda.sif  
Apptainer> busco
usage: busco -i [SEQUENCE_FILE] -l [LINEAGE] -o [OUTPUT_NAME] -m [MODE] [OTHER OPTIONS]
```

You can access Python in this container the same way:  

```
CCRusername@cpn-h23-04:~$ apptainer shell conda.sif  
Apptainer> python
Python 3.10.16 | packaged by conda-forge | (main, Apr  8 2025, 20:53:32) [GCC 13.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Please refer to the CCR [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more info on accessing project directories, using GPUs, and other important topics.