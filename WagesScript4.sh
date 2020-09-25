var12=$(cat $1 | grep -E .+,.+,12,.+ | sort -k 4,4n -t "," | head -n 1 | awk -F "," '{print $4}')
var16=$(cat $1 | grep -E .+,.+,16,.+ | sort -k 4,4n -t "," | head -n 1 | awk -F "," '{print $4}')
echo "$var16 - $var12" | bc

