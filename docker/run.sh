#! bin/bash
thread=$1

t1_1T=textblob-performance-analysis/inputs/t1/small1

input_t1_csv=../data/csvs/t1.csv


if [[ $thread = "1" ]]
then
	perf stat -I 100 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
fi
