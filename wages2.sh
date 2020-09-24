# usage bash wages2.sh
echo -n "top earner: " 
cat "$1" | cut -d , -f 1,2,4 | sort -k 4 -r | head -n 1 
echo -n "bottom earner: " 
cat "$1" | cut -d , -f 1,2,4 | sort -k 4 -r | tail -n 1
echo -n "number of females in top 10:"
cat "$1" | cut -d , -f 1,2,4 | sort -k 4 -r | head -n 10 | grep female | wc -l 
