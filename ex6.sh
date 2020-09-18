#ex1: sorts by gender and yearsExp

cat wages.csv | cut -d , -f 1,2 | tr , " " | sort -k 1,1 -k2,2n | uniq

#ex2:returns gender, yrs exp, wage for highest earner
#returns gender, yrs exp, wage for lowest earner
#returns number of females in top ten earners

echo "highest earner gender, yrs exp, wage:"
cat wages.csv | sort -t , -k4,4nr | head -n 1 | cut -d , -f 1,2,4

echo "lowest earner gender, yrs exp, wage:"
cat wages.csv | sort -t , -k4,4n | head -n 2 | tail -n 1 | cut -d , -f 1,2,4

echo "number of females in top ten earners:"
cat wages.csv | sort -t , -k4,4nr | head -n 10 | grep -c "female"


#ex3: returns lowest wages of 16yrs of school - lowest wages of 12yrs of school

twelve=$(cat wages.csv | cut -d , -f 3,4 | grep "^12" | sort -t , -k 2,2n | head -n 1 | cut -d , -f 2)
sixteen=$(cat wages.csv | cut -d , -f 3,4 | grep "^16" | sort -t , -k 2,2n | head -n 1 | cut -d , -f 2)

echo "$sixteen - $twelve" | bc
