# Shell script which extracts wage, gender, experience information from wages.csv file
# Usage: bash finalEx6.sh

# Task 1:
cat wages.csv | cut -d, -f 1,2 | sort -t, -k1,1 -k2,2n | tr "," " " | uniq > gender_Exp_Sorted.txt

# Task 2:
echo "Highest earner"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 | tail -n 1
echo "Lowest earner"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 | head -n 2 | tail -n 1
echo "Top ten female earners"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 -r | head -n 10 | grep -c "female"

# Task 3:
HS_minWage=$(cat wages.csv | cut -d, -f 3,4 | sort -n | grep -E '12,' | head -n 1 | cut -d, -f 2 | tr -d $'\r')
COLLEGE_minWage=$(cat wages.csv | cut -d, -f 3,4 | sort -n | grep -E '16,' | head -n 1 | cut -d, -f 2 | tr -d $'\r')
count=$(echo "$COLLEGE_minWage - $HS_minWage" | bc)
echo $count
# The difference between the two wages is about 10.02517...

# We had to make a new "Ex6" file from the one previously committed/pushed since we kept getting hidden character errors (e.g. carriage return, ^M, etc.) with the original one
