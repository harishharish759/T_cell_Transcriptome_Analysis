#!/bin/bash


for file in rawdata/fastq/*R1_001.fastq.gz 

    do

        file2="${file/R1_001/R2_001}"
        SAMPLE="${file/"rawdata/fastq/"/""}"
        SAMPLE="${SAMPLE/"_R1_001.fastq.gz"/""}"

        OUTFOLDER=bams/$SAMPLE/

        echo Mapping $file

        STAR --runThreadN 32 \
            --quantMode GeneCounts \
            --sjdbGTFfile references/hg38_ens/Homo_sapiens.GRCh38.104_ERCC92.gtf \
            --genomeDir references/hg38_fasta/ \
            --readFilesIn $file $file2 \
            --readFilesCommand zcat \
            --clip3pAdapterSeq AGATCGGAAGAGCACACGTCTGAACTCCAGTCA AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
            --clip3pAdapterMMp 0.1 0.1 \
            --bamRemoveDuplicatesType UniqueIdentical \
            --outBAMcompression 6 \
            --outFileNamePrefix $OUTFOLDER \
            --outSAMtype BAM Unsorted \

    done

STAR --genomeLoad Remove