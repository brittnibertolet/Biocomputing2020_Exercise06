#This is the script for part 2 of exercise 6. 
#This script must do 3 things 1) display data (gender, years experience, and wage) for highest earner 
# 2) dislay the same data for the lowest earner and 3)display the number of females in the top 10 wage earners

echo -n "Highest Earner: " 
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | tail -n 2 | head -n 1
echo -n "Lowest Earner: " 
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | head -n 1
echo -n "Number of Top 10 Earners Who are Women: " 
cat wages.csv | sort -r  -t , -k 4 | head -n 11 |grep  "female" |wc -l

