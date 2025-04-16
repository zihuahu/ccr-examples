# Application Specific Slurm Script Examples

## Using these examples

This directory contains batch scripts for a variety of applications that have special setup requirements.  You will not find an example script for every piece of software installed on CCR's systems.  These examples should be used as guidance and are not set in stone.  Please start with these examples, test for your own use case, and scale as required.

For additional SLURM directives, refer to [slurm-options.sh](../slurm-options.sh) 

## Table of Topics

| Topic                                | Description |
|--------------------------------------|------------------------|
| [AlphaFold](./2_ApplicationSpecific/alphafold)                | AlphaFold example |
| [LSDYNA](./2_ApplicationSpecific/lsdyna)                      | LSDYNA example |
| [MATLAB](./2_ApplicationSpecific/matlab)                      | The MATLAB directory includes example scripts for running [serial](./2_ApplicationSpecific/matlab/serial), [multithreaded](./2_ApplicationSpecific/matlab/multithreaded), and [GPU](./2_ApplicationSpecific/matlab/GPU) MATLAB jobs |
| [Python](./2_ApplicationSpecific/python)                      | A directory containing examples of [serial](./2_ApplicationSpecific/python/serial) Python job, with multithreaded and GPU examples coming soon |
