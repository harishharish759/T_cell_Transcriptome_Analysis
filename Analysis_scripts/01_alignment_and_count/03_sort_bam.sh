#!/bin/bash

for file in bams/*.bam

    do

        outfile="${file/"bams/"/""}"
        outfile="${outfile::-4}"

        samtools sort $file -@ 8 -m 5G -o $outfile.sortedByCoord.bam

    done