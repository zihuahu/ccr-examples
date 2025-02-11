# Basic Slurm Job

## Using these examples

The example Slurm script `(BasicExample.sh)` can be used to submit a basic job in an HPC environment. It highlights key features such as cluster, partition, memory requirements, and more.

The example Slurm script `(debug.sh)` can be used to submit a job to the debug partition. (WIP)

For additional SLURM directives, refer to [`(slurm-options.sh)`](https://github.com/ubccr/ccr-examples/blob/main/slurm/slurm-options.sh) 

## Placeholders:

Portions of the example batch scripts which must be changed for the script to function are referred to as placeholders and denoted by square brackets. Replace the following placeholders in your
script with details specific to your use case before submitting your job.

- `[cluster]`: ub-hpc, faculty
- `[partition]`: general-compute, debug, industry, scavenger, ub-laser, [other available options](https://docs.ccr.buffalo.edu/en/latest/hpc/clusters/#ub-hpc-compute-cluster)
- `[qos]`: usually the same as `[partition]` - refer to [CCR docs](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#slurm-directives-partitions-qos)
- `[SlurmAccountName]`: Tell Slurm which account to run this job under. If not specified, your default account will be used. Use the `slimits` command to see what accounts you have access to.

## How to launch an interactive job on the faculty cluster

Use the `salloc` command and the same Slurm directives as you use in a batch script to request an interactive job session.  Please refer to our [documentation](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#interactive-job-submission) for proper setup of the request and command to use to access the allocated node. 
