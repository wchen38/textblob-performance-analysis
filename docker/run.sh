#! bin/bash
thread=$1

plot=textblob-performance-analysis/docker/src/plot.R

t1_1T=textblob-performance-analysis/inputs/t1/small1
t1_1T4=textblob-performance-analysis/inputs/t1/small1
t1_1T16=textblob-performance-analysis/inputs/t1/small1
t1_1T64=textblob-performance-analysis/inputs/t1/small1
t1_1T256=textblob-performance-analysis/inputs/t1/small1

input_t1_csv=../data/csvs/t1.csv
output_t1_csv=../data/csvs/t1_new.csv


if [[ $thread = "1" ]]
then
	echo thread 1 in the run.sh file-------------------------------------------
	perf stat -I 100 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
	interval-normalize.py $input_t1_csv > $output_t1_csv
	Rscript $plot
	
	perf stat -I 100 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T4" test1
	Rscript plot.R
elif [[ $thread = "2" ]]
then 
	echo thread 2 in the run.sh file---------------------------------------------
elif [[ $thread = "4" ]]
then 
	echo thread 4 in the run.sh file--------------------------------------------
elif [[  $thread = "8" ]]
then
	echo thread 8 in the run.sh file--------------------------------------------
else 
	echo invalid thread number
fi
