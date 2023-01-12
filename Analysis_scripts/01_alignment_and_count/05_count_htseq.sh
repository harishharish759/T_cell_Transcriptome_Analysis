#!/bin/bash

for file in *.bam

    do

        htseq-count -f bam -r pos -s yes $file references/hg38_refseq/hg38.ncbiRefSeq.gtf.gz > counts/hg38refseq/$file.htseq.counts.txt 2> counts/hg38refseq/$file.htseq.log

    done