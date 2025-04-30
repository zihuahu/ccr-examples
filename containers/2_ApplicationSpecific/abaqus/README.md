# Running Abaqus with Apptainer

Abaqus 2024 is available via an Apptainer/Singularity container. You can find the Abaqus container here: `/util/software/containers/x86_64/abaqus-2024.sif`
This is a large file (10GB) so please be sure to copy it to a location where you have enough space (i.e. your project directory), or you can run the container from this location.

**Note**: Apptainer/Singularity is only available on compute and compile nodes. Please refer to our [container documentation](https://docs.ccr.buffalo.edu/en/latest/howto/containerization/) for more information on using containers.

## Abaqus Command Line/Batch Script

To run Abaqus from the command line, run this command: `$ apptainer exec -B /util:/util,/scratch:/scratch /util/software/containers/x86_64/abaqus-2024.sif /bin/bash`

**Tip**: The `-B` option is telling Apptainer/Singularity which directories on the node you want to bind mount into the container. You will automatically get access to your home directory. The directories we have listed here to bind mount are required. If you also want access to your project directory you can add `,/projects:/projects` to the list or your specific directory `,/projects/academic/[YourGroupName]:/projects/academic/[YourGroupName]` for example.

A Slurm script [`abaqus-test.sh`](./abaqus-test.sh) is provided with all necessary configuration for running Abaqus in a batch script. Update the file paths and resource requests according to your needs. Once the container starts you'll see the Apptainer command prompt and then you can run the Abaqus command as normal. For example: `Apptainer> abaqus help`

## Abaqus GUI

To run the Abaqus GUI using this container, first start an [OnDemand desktop](https://docs.ccr.buffalo.edu/en/latest/portals/ood/#interactive-apps) session. Once started, launch a terminal in the OnDemand desktop. Then run this command to start the container and launch the Abaqus GUI: `$ apptainer exec -B /util:/util,/scratch:/scratch /util/software/containers/x86_64/abaqus-2024.sif abaqus cae -mesa`

## Abaqus and GPUs

If you need to use GPUs with Abaqus you'll need to request a GPU node and add a few things to the Apptainer/Singularity command that starts the container. Add this after the rest of your bind mounts in the Apptainer/Singularity exec command: `,/opt/software/nvidia:/opt/software/nvidia --nv`

To run the Abaqus GUI on a GPU node, the command would be: `$ apptainer exec -B /util:/util,/scratch:/scratch,/opt/software/nvidia:/opt/software/nvidia --nv /util/software/containers/x86_64/abaqus-2024.sif abaqus cae -mesa`

**NOTE**: If you're using the Abaqus GUI, we recommend running on the viz partition and qos of the UB-HPC cluster. However, this will work from any GPU node.

Please refer to the [Abaqus (Simulia) documentation](https://help.3ds.com/2020/English/DSSIMULIA_Established/SIMULIA_Established_FrontmatterMap/sim-t-SIMULIA_EstablishedDocSearchOnline.html) for additional information and support on using this software.
