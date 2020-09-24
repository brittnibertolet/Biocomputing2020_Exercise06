for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | cut -f 3,4 -d, >> tempC3.txt
done

for file in "tempC3.txt"
do 
cat "$file" | grep -E "[1][2]+[\,][0-9][\.]([0-9])+" | sort -t, -k2,2 -n | cut -f 2 -d,  >> 12years.txt
done

for file in "tempC3.txt"
do 
cat "$file" | grep -E "[1][6]+[\,][0-9][\.]([0-9])+" | sort -t, -k2,2 -n | cut -f 2 -d,  >> 16years.txt
done

paste -d" " 12years.txt 16years.txt > yearsExp_effect.txt
awk '{a=$2-$1;print $0,a;}' yearsExp_effect.txt
