#!/bin/bash


# number of cores over which the process will be parallelized
#thread=$1
#num_loop=$2
#t1_f1=../../inputs/t1/small1
src=textblob-performance-analysis/docker/src/text_blob.py
#t1_f1=textblob-performance-analysis/inputs/t1/small1

#input_t1_csv=../../data/csvs/t1.csv
#input_t2_csv=../../data/csvs/t2/t2.csv
#input_t4_csv=../../data/csvs/t4/t4.csv
#input_t8_csv=../../data/csvs/t8/t8.csv

#output_t1_csv=../../data/csvs/t1_new.csv
#output_t2_csv=../../data/csvs/t2/t2_new.csv
#output_t4_csv=../../data/csvs/t4/t4_new.csv
#output_t8_csv=../../data/csvs/t8/t8_new.csv


# runs OCR on the found TIFF files and converts them to text. Assumes English, but you can supply
# extra arguments to tesseract
#parallel --bar -j $num_cores ./text_blob.py
echo hello world!
#echo $t1_f1
#echo $thread
#ls ~/
#ls /
#pwd
#ls textblob-performance-analysis/docker/src/$t1_f1
if [[ $thread = "1" ]]
then
     echo ------------------------using thread 1
     python $src $file 8
elif [[ "thread" = "2" ]]
then
     echo -------------------------using thread 2
     parallel ::: "python $src $file 4" "src $file 4"
elif [[ "thread" = "4" ]]
then
     echo -------------------------using thread 4
     parallel ::: "python $src $file 2" \
     "python $src $file 2" "python $src $file 2"  "python $src $file 2"
elif [[ "thread" = "8" ]]
then    
     echo ------------------------ using thread 8
     parallel ::: "python $src $file 1" \
     "python $src $file 1" "python $src $file 1"  "python $src $file 1" "python $src $file 1" \
     "python $src $file 1" "python $src $file 1"  "python $src $file 1"
else 
     echo thread is invalid
fi
