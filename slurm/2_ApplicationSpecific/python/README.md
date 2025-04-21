# Python on the CCR Clusters

This directory includes examples of a serial Python job, with mutlithreaded and GPU examples coming soon.  Additional documentation about the use of Python at CCR can be found in the CCR's [Python documentation](https://docs.ccr.buffalo.edu/en/latest/howto/python/).  Users affiliated with the University at Buffalo can access an open enrollment self paced course about [Using Python at CCR](https://ublearns.buffalo.edu/d2l/le/discovery/view/course/288741) through UB Learns.  The pre-recorded video portions of the course are available to all users on [CCR's YouTube channel](https://youtube.com/@ubccr).

## Serial Python job ([serial/](./serial))

A serial Python job is one that requires only a single CPU-core.

Provided is an example of a serial Python program (`fibonacci.py`) with the corresponding Slurm script (`python-sp.sh`) that can be modified to run a serial Python job.

To run the Python script, simply submit the job to the scheduler from a login node with the following command:
```
$ sbatch python-sp.sh
```
