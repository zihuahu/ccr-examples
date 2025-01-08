#General Slurm Job

**Using this example**

This example can be used to submit a basic job in an HPC environment. It highlights key features such as cluster, partition selection, node allocation, CPUs per task, memory requirements, etc. 
Replace the following placeholders in the script with details specific to your requirments before submitting your jobs.

Placeholders:

-'[CCRusername]': Your CCR username
-'[cluster]': ub-hpc, faculty
-'[partition]': debug, general-compute, industry, scavenger, ub-laser
-'[qos]': [partition]
-'[SlurmAccountName]': Tell Slurm which account to run this job under. If not specified, your default account will be used. Use the `slimits` command to see what accounts you have access to
-'[MailType]': all, begin, end, requeue, time_limit

**How to launch an interactive job on the faculty cluster**

Use the salloc command and the same Slurm directives as you use in a batch script to request an interactive job session. Please refer to our documentation for proper setup of the request and command 
to use to access the allocated node.
