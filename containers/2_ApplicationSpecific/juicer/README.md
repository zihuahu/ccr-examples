# Example Juicer container
This example goes over how to pull and run Juicer containers at CCR. Instructions to pull Juicer containers are available on [github](https://github.com/ArimaGenomics/Juicer_pipeline_containers), however we have some slightly modified guidance to properly pull these containers. 

## Pulling container

Instead of using the pre-built `Singularity` image, CCR recommends you pull the available `docker` image on CCR's systems. The commands to do so are:

```
export APPTAINER_CACHEDIR=/projects/academic/[YourGroupName]/[CCRusername]/cache
apptainer pull juicer.sif docker://arimaxiang/arima_juicer
```

## Running container

With the container image pulled down, you can run the Juicer software with the instructions from the github repository. 

First, you make a directory to store your `fastq` files and move your files there:
```
export OUTPUT_DIR="/projects/academic/[YourGroupName]/[CCRusername]/juicer"
mkdir -p $OUTPUT_DIR/fastq/
mv test_sample_R*.fastq.gz $OUTPUT_DIR/fastq/
```

You should also specify a directory containing your reference genome:
```
export INPUT_reference="/projects/academic/[YourGroupName]/[CCRusername]/reference"
```

Finally, you'll run `juicer.sh` with the following command. You should modify the reference files as necessary for your use case.
```
apptainer exec -B $OUTPUT_DIR -B $INPUT_reference juicer.sif juicer.sh -d $OUTPUT_DIR -D /opt/ -p $INPUT_reference/hg38.chrom.sizes -y $INPUT_reference/hg38_GATC_GANTC.txt -z $INPUT_reference/hg38.fa -t 20 &> $OUTPUT_DIR"/juicer.log"
```
