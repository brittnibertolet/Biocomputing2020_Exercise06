#Sorts wages.csv  alphabetically in first column and numerically in second column
#usage: bash wages1.sh filename

cat wages.csv | cut -d , -f 1,2 | sort -t , -k1,1 -k2n,2 | uniq |sed '/gender/d' |  tr ',' ' ' >> unique1.txt



