# Python on the CCR Clusters

This directory includes examples of serial, multithreaded, and GPU  Python jobs. (CCR Staff: Need more info here)

## Placeholders:

Portions of the example batch scripts contain placeholders, denoted by square brackets. Refer to the 2_ApplicationSpecific 
[README](../README.md) for details and options.

## Serial Python job ([serial/](./serial))

A serial Python job is one that requires only a single CPU-core.

Provided is an example of a trivial, one-line serial Python program (`fibonacci.py`) with the corresponding Slurm script (`python-sp.sh`) that can be modified to run a serial Python job.

To run the Python script, simply submit the job to the scheduler from a login node with the following command:
```
$ sbatch python-sp.sh
```
- NOTE: When you're done, make sure to quit Python and then type `exit` to log out of the compute node and properly release the resources for other users.
