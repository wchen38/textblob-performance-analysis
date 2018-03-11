#! bin/bash
thread=$1

plot=src/plot.R
plot2=src/plot2.R
plot4=src/plot4.R
plot8=src/plot8.R

t1_1T=textblob-performance-analysis/inputs/t1/1
t1_1T4=textblob-performance-analysis/inputs/t1/ddd
t1_1T16=textblob-performance-analysis/inputs/t1/1T_16
t1_1T64=textblob-performance-analysis/inputs/t1/1t64
t1_1T256=textblob-performance-analysis/inputs/t1/1T256

input_t1_csv=../data/csvs/t1.csv
output_t1_csv=../data/csvs/t1_new.csv
plot_data_out=./dockerdata/

if [[ $thread = "1" ]]
then
	echo thread 1 in the run.sh file-------------------------------------------
	perf stat -I 15000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
	interval-normalize.py $input_t1_csv > $output_t1_csv
	Rscript $plot ./dockerdata/thread1_1T.pdf
	
	perf stat -I 10000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T4" test1
	interval-normalize.py $input_t1_csv > $output_t1_csv
	Rscript $plot ./dockerdata/thread1_1T4.pdf

	perf stat -I 5000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T64" test1
	interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot ./dockerdata/thread1_1T16.pdf
	
	perf stat -I 2000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot ./dockerdata/thread1_1T64.pdf 

        perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot ./dockerdata/thread1_1T256.pdf

elif [[ $thread = "2" ]]
then 
	echo thread 2 in the run.sh file---------------------------------------------
        perf stat -I 10000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot2 $plot_data_out/thread2_1T.pdf 

        perf stat -I 5000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T4" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot2 $plot_data_out/thread2_1T4.pdf

        perf stat -I 3000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T64" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot2 $plot_data_out/thread2_1T16.pdf

        perf stat -I 2000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot2 $plot_data_out/thread2_1T64.pdf

        perf stat -I 1500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot2 $plot_data_out/thread2_1T256.pdf

elif [[ $thread = "4" ]]
then 
	echo thread 4 in the run.sh file--------------------------------------------
        perf stat -I 5000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot4 $plot_data_out/thread4_1T.pdf

        perf stat -I 3000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T4" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot4 $plot_data_out/thread4_1T4.pdf

        perf stat -I 2000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T64" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot4 $plot_data_out/thread4_1T16.pdf

        perf stat -I 1000 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot4 $plot_data_out/thread4_1T64.pdf

        perf stat -I 100 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot4 $plot_data_out/thread4_1T256.pdf

elif [[  $thread = "8" ]]
then
	echo thread 8 in the run.sh file--------------------------------------------
        perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot8 $plot_data_out/thread8_1T.pdf

        perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T4" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot8 $plot_data_out/thread8_1T4.pdf

        perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T64" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot8 $plot_data_out/thread8_1T16.pdf

        perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot8 $plot_data_out/thread8_1T64.pdf

        perf stat -I 500 -e L1-dcache-load-misses,instructions,l2_rqsts.miss,branch-misses,cycles,LLC-load-misses -x, \
        -o $input_t1_csv docker run -e thread=1 -e file="$t1_1T256" test1
        interval-normalize.py $input_t1_csv > $output_t1_csv
        Rscript $plot8 $plot_data_out/thread8_1T256.pdf

else 
	echo invalid thread number
fi
