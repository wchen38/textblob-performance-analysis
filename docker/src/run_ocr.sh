#!/bin/bash


# number of cores over which the process will be parallelized
#thread=$1
#num_loop=$2
#t1_f1=../../inputs/t1/small1
src=textblob-performance-analysis/docker/src/text_blob.py
t1_f1=../../inputs/t1/small1
t2_f1=./textblob-performance-analysis/inputs/t2/1
t2_f2=./textblob-performance-analysis/inputs/t2/2

input_t1_csv=../../data/csvs/t1.csv
input_t2_csv=../../data/csvs/t2/t2.csv
input_t4_csv=../../data/csvs/t4/t4.csv
input_t8_csv=../../data/csvs/t8/t8.csv

output_t1_csv=../../data/csvs/t1_new.csv
output_t2_csv=../../data/csvs/t2/t2_new.csv
output_t4_csv=../../data/csvs/t4/t4_new.csv
output_t8_csv=../../data/csvs/t8/t8_new.csv


# runs OCR on the found TIFF files and converts them to text. Assumes English, but you can supply
# extra arguments to tesseract
#parallel --bar -j $num_cores ./text_blob.py
echo hello world!
echo $t1_f1
echo $thread
#pwd
#ls textblob-performance-analysis/docker/src/$t1_f1
if [[ $thread = "1" ]]
then
     echo ------------------------using thread 1
     python $src $t1_f1 8
     #interval-normalize.py $input_t1_csv > $output_t1_csv
     #Rscript plot.R
fi

if [ 0 = 1 ]
then
     echo -------------------------using thread 2
     perf stat -I 50 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o $input_t2_csv parallel ::: "python text_blob.py $t1_f1 4" "python text_blob.py $t1_f1 4"
     interval-normalize.py $input_t2_csv > $output_t2_csv
     Rscript plot2.R    

     echo -------------------------using thread 4
     perf stat -I 50 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o $input_t4_csv parallel ::: "python text_blob.py $t1_f1 2" \
     "python text_blob.py $t1_f1 2" "python text_blob.py $t1_f1 2"  "python text_blob.py $t1_f1 2"
     interval-normalize.py $input_t4_csv > $output_t4_csv
     Rscript plot4.R
    

     echo ------------------------ using thread 8
     perf stat -I 50 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o $input_t8_csv parallel ::: "python text_blob.py $t1_f1 1" \
     "python text_blob.py $t1_f1 1" "python text_blob.py $t1_f1 1"  "python text_blob.py $t1_f1 1" "python text_blob.py $t1_f1 1" \
     "python text_blob.py $t1_f1 1" "python text_blob.py $t1_f1 1"  "python text_blob.py $t1_f1 1"
     interval-normalize.py $input_t8_csv > $output_t8_csv
     Rscript plot8.R
     echo not using any threads
fi
