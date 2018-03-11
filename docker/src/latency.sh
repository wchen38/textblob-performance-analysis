loops=$1
t1_f1=../inputs/t1/small1
perf stat python text_blob.py $t1_f1 $loops
