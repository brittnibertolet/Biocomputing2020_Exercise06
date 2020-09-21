cat wages.csv | tail -n 3294 | cut -d , -f 1,2 | tr ',' ' ' | sort -u -V

