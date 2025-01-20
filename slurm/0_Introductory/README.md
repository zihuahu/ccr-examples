# Basic Slurm Job

## Using this example

This example can be used to submit a basic job in an HPC environment. It highlights key features such as cluster, partition, memory requirements, and more.

Replace the following placeholders in the script with details specific to your requirments before submitting your job.

## Placeholders:

- `[cluster]`: ub-hpc, faculty
- `[partition]`: debug, general-compute, industry, scavenger, ub-laser
- `[qos]`: `[partition]`

## How to launch an interactive job on the faculty cluster  

Use the `salloc` command and the same Slurm directives as you use in a batch script to request an interactive job session.  Please refer to our [documentation](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) for proper setup of the request and command to use to access the allocated node.

## For advanced options and how to use them refer to the `slurm-options.sh` file in the parent directory. 
