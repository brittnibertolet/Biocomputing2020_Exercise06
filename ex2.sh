#returns gender, yrs exp, wage for highest earner
#returns gender, yrs exp, wage for lowest earner
#returns number of females in top ten earners
#usage: bash ex2.sh

echo "highest earner gender, yrs exp, wage:"
cat wages.csv | sort -t , -k4,4nr | head -n 1 | cut -d , -f 1,2,4

echo "lowest earner gender, yrs exp, wage:"
cat wages.csv | sort -t , -k4,4n | head -n 2 | tail -n 1 | cut -d , -f 1,2,4

echo "number of females in top ten earners:"
cat wages.csv | sort -t , -k4,4nr | head -n 10 | grep -c "female" 

