#!/bin/bash


# number of cores over which the process will be parallelized
num_thread=$1
num_loop=$2
t1_f1=./inputs/t1/1
t2_f1=./inputs/t2/1
t2_f2=./inputs/t2/2
OPATH=./
input_csv=./data/csvs/t1.csv
output_csv=./data/csvs/t1_new.csv

# runs OCR on the found TIFF files and converts them to text. Assumes English, but you can supply
# extra arguments to tesseract
#parallel --bar -j $num_cores ./text_blob.py

if [ $num_thread = '1' ]
then
     echo using thread 1
     perf stat -I 10000 -e L1-dcache-load-misses,instructions, l2_rqsts.miss -x, -o $input_csv python text_blob.py $t1_f1 $num_loop
     #perf stat -e L1-dcache-load-misses,instructions -x, -o $input_csv python text_blob.py $t1_f1 $num_loop
     interval-normalize.py $input_csv > $output_csv
     Rscript plot.R
elif [ $num_thread = '2' ]
then
     echo using thread 2
     ocperf.py stat parallel ::: "python text_blob.py $t2_f1 $num_loop" "python text_blob.py $t2_f2 $num_loop"
elif [ $num_thread = '4' ]
then
     echo using thread 4
elif [ $num_thread = '8' ]
then
     echo using thread 8
else
     echo not using any threads
fi


