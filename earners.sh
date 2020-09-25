#usuage bash earners.sh wages.csv
#gender, yearsExperienced, and wage for the highest earner
#gender, yearsExperienced, and wage for lowest earner
#number of females in top to earners in wages.csv

cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | head -1 

cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | tail -2 | grep -v "gender,yearsExperience,wage"

cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | head -10 | grep -w "female" | wc -l
