cat $1 | grep female | cut -d , -f 1,2,4 | sort -k 3,3n -t "," | tail -n 10
