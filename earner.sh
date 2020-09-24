#usuage bash earner.sh wages.csv
#gender, yearsExperienced, and wage for the highest earner
#gender, years experienced, and wage for lowest earner
#number of females in the top 10 earners

#gender, yearsExperienced, and wage for the highest earner
echo "gender, years experienced, and wage for the highest earner"
cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | head -1 


#gender, years experienced, and wage for lowest earner
echo "gender, years experinced and wage for the lowest earner"
cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | tail -2 | grep -v "gender,yearsExperience,wage"


# number of females in the top ten earners
echo "number of females in the top ten earners"
cat wages.csv | cut -d "," -f 1,2,4 | sort -t, -k3,3nr | head -10 | grep -w "female" | wc -l
