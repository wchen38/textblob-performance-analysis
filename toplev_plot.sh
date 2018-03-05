input_csv=./data/csvs/t1.csv
output_csv=./data/csvs/t1_new.csv
toplev.py --all -I 1000 -x, -o $input_csv bash run_ocr.sh 1 1
interval-normalize.py $input_csv > $output_csv
Rscript plot.R

