# Example script for GPU usage

This directory includes a [basic example](./BasicExample.sh) that shows how to request and run a GPU-enabled job on CCR's clusters.  

## How to use

CCR's academic cluster has a mix of compute nodes from various generations of hardware with a variety of GPU types in them. Most of these compute nodes have either 1 or 2 GPUs, while one node has 12 
A16 GPUs. Though you could request multiple nodes with GPUs, our GPU nodes are under heavy demand and wait times can be long, even when only requesting a single GPU.

The provided [script](./BasicExample.sh) is a minimal Slurm example that uses a GPU. Make sure to modify parts of the script to suit your GPU requirements and specific needs. For 
more details, refer to the [1_Advanced README](../README.md).

If you need more than the default, you can specify hardware requirements using the Slurm `--constraint` directive in the batch script or using the Node Features field in OnDemand app forms. Supported GPU types include `A40`, `A100`, `H100`, `GH200`, and `V100`.

For an example, see the [slurm-options.sh](../../slurm-options.sh) file. For additional options and details refer to our [documentation](https://docs.ccr.buffalo.edu/en/latest/hpc/jobs/#slurm-directives-partitions-qos).

## Monitoring GPU Usage with Grafana Charts

CCR provides detailed performance metrics through Grafana charts, including GPU, CPU, and memory usage for completed jobs. 
- Access via OnDemand: Navigate to Active Jobs, click the dropdown for your job, and select `View details metrics` for Grafana.
- Access via Terminal: You need to query Slurm for the appropriate start and end times and get the node list. To do this, we provide a script that can be run in the terminal that creates the Grafana 
URL for your job:
```
CCRusername@login:~$ ccr-jobview-url [jobid] [cluster]
```
Then you would paste the outputed link into your browser.



