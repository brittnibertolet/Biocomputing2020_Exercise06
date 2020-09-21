#task 1
cat wages.csv | tail -n 3294 | cut -d , -f 1,2 | tr ',' ' ' | sort -u -V

#task 2
cat wages.csv | sort -t, -k4,4 -nr

