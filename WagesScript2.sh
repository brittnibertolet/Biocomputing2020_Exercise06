cat $1 | cut -d , -f 1,2,4 | sort -k 3,3n -t "," | head -n 2
