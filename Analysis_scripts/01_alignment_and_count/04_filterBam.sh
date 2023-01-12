#!/bin/bash

for file in bams/*.bam
    do

        outfile="${file::4}"
        samtools view -@4 -bSq 1 $file > $outfile

    done
