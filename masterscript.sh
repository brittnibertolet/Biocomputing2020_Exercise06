cat wages.csv | cut -d , -f 1,2 | sort -t , -k1,1 -k2n,2 | uniq | sed '/gender/d' |  tr ',' ' ' >> unique1.txt
echo -n "top earner: "
cat wages.csv | cut -d , -f 1,2,4 | sort -k 4 -r | head -n 1
echo -n "bottom earner: "
cat wages.csv | cut -d , -f 1,2,4 | sort -k 4 -r | tail -n 1
echo -n "number of females in top 10:"
cat wages.csv | cut -d , -f 1,2,4 | sort -k 4 -r | head -n 10 | grep female | wc -l
val12=$(cat wages.csv | cut -d , -f 3,4 | grep -E 12, | sort -t , -k1,1 -k2n,2 | head -n 1 | cut -d , -f 2) 
val16=$(cat wages.csv | cut -d , -f 3,4 | grep -E 16, | sort -t , -k1,1 -k2n,2 | head -n 1 | cut -d , -f 2) 
echo -n "effect of graduating college: "
echo "$val16 - $val12" | bc

