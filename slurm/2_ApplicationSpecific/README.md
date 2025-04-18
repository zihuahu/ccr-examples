# Application Specific Slurm Script Examples

## Using these examples

This directory contains batch scripts for a variety of applications that have special setup requirements.  You will not find an example script for every piece of software installed on CCR's systems.  These examples should be used as guidance and are not set in stone.  Please start with these examples, test for your own use case, and scale as required.

## Table of Topics

| Topic                                | Description |
|--------------------------------------|------------------------|
| [AlphaFold](./alphafold)                | AlphFold example including a dataset for testing and validation |
| [LSDYNA](./lsdyna)                      | LSDYNA examples for both single and multi node message passing parallel jobs as well as single node shared memory parallel jobs (See [README](./lsdyna/README.md) |
| [MATLAB](./matlab)                      | The MATLAB directory includes example bash scripts and MATLAB functions for running [serial](./matlab/serial), [multithreaded](./matlab/multithreaded), and [GPU](./matlab/GPU) MATLAB jobs |
| [Python](./python)                      | The Python directory includes examples bash scripts and Python functions for [serial](./python/serial) Python job, with multithreaded and GPU examples coming soon |

## Additional Information

For more details on placeholder values, Slurm usage and common directives, refer to the following resources:

- [Slurm README](../README.md)
- [Placeholder Guide](../README.md#placeholders)
- [slurm-options.sh](../slurm-options.sh)
