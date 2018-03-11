input_csv=./data/csvs/t1.csv
output_csv=./data/csvs/t1_new.csv

#toplev.py --all -I 15000 -x, -o $input_csv bash run_ocr.sh 1 8
#interval-normalize.py $input_csv > $output_csv
#Rscript plot.R
ocperf.py stat -I 100 -e L1-dcache-load-misses,instructions,cycle -x, -o $input_csv bash run_ocr.sh 1 1
interval-normalize.py $input_csv > $output_csv
Rscript plot.R 

