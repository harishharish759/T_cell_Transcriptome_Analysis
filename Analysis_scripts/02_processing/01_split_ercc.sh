#!/bin/bash

for file in counts/*.tab
    do
        cat $file | grep ERCC > ${file::-4}.ercc.tab
    done


for file in counts/*.tab
    do
        cat $file | grep -v ERCC > ${file::-4}.hg38.tab
    done