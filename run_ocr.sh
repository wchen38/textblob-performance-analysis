#!/bin/bash


# number of cores over which the process will be parallelized
num_thread=$1
num_loop=$2
t1_f1=./inputs/t1/1
t2_f1=./inputs/t2/1
t2_f2=./inputs/t2/2
OPATH=./

# runs OCR on the found TIFF files and converts them to text. Assumes English, but you can supply
# extra arguments to tesseract
#parallel --bar -j $num_cores ./text_blob.py

if [ $num_thread = '1' ]
then
     echo using thread 1
     #bash toplev_plot.sh
     ocperf.py stat parallel ::: "python text_blob.py $t1_f1 $num_loop"
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


