#! bin/bash
thread=$1

t1_f1=../../inputs/t1/1T256
t2_f1=../../inputs/t2/1
t2_f2=../../inputs/t2/2

input_t1_csv=../../data/csvs/t1.csv
input_t2_csv=../../data/csvs/t2/t2.csv
input_t4_csv=../../data/csvs/t4/t4.csv
input_t8_csv=../../data/csvs/t8/t8.csv

output_t1_csv=../../data/csvs/t1_new.csv
output_t2_csv=../../data/csvs/t2/t2_new.csv
output_t4_csv=../../data/csvs/t4/t4_new.csv
output_t8_csv=../../data/csvs/t8/t8_new.csv

perf stat -I 50 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, -o $input_t1_csv docker run -e thread=1 test1
