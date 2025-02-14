# Serial Matlab

A serial MATLAB job is one that requires only a single CPU-core.

## Using this example

The example Slurm script `(matlab-sp.sh)` can be modified to run a serial MATLAB job. By invoking MATLAB with `-singleCompThread` `-nodisplay` `-nosplash`, the GUI is suppressed as is the creation of multiple threads. To run the MATLAB script, simply submit the job to the scheduler from a login node.
