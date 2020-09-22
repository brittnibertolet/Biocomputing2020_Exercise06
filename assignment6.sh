#task 1
cat wages.csv | tail -n 3294 | cut -d , -f 1,2 | tr ',' ' ' | sort -u -V

#task 2
cat wages.csv | sort -t , -k 4,4 -nr | head -n 1 | cut -d , -f 1,2,4
cat wages.csv | sort -t , -k 4,4 -nr | tail -n 2 | head -n 1 | cut -d , -f 1,2,4
cat wages.csv | sort -t, -k4,4 -nr | head -n 10 | grep -E -c "female"

#task 3

