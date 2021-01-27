#!/bin/env bash

## readcount overall
for i in *.fastq ; do
    all_lines=$(cat $i* |wc -l)
    echo $i,"$(( $all_lines / 4 ))"
done
