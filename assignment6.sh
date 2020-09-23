# usage: bash assignment6.sh wages.csv

#task 1
# get rid of column names, get the first 2 columns (gender, years experience), replace all commas with spaces, then find unique combinations and sort by number of years
cat $1 | tail -n 3294 | cut -d , -f 1,2 | tr ',' ' ' | sort -u -V > gender-yearsexperience.txt

#task 2
# set them all as variables so we can print all to stdout with labels
# for the highest and lowest earners, get rid of school years, then sort by the third column (wages), then take the top and bottom (excluding the column names)
# for number of females in top 10, sort by 4th column (wages) and take the top 10, then find the number of lines that contain the word “female”
VARHIGH=$(cat wages.csv | cut -d , -f 1,2,4 | sort -t, -k3,3 -nr | head -n 1)
VARLOW=$(cat wages.csv | cut -d , -f 1,2,4 | sort -t, -k3,3 -nr | tail -n 2 | head -n 1)
VARFEM=$(cat wages.csv | sort -t, -k4,4 -nr | head -n 10 | grep -E -c "female")

#task 3
# take out the first two columns, find all instances of 12 or 16 years of schooling, sort numerically, leave only the wage values, take the lowest wage, subtract to find the number of lines that contain the word “female”
val1=$(cat wages.csv | cut -d , -f 3,4 | grep -E "12," | sort -n | cut -d , -f 2 | head -n 1)
val2=$(cat wages.csv | cut -d , -f 3,4 | grep -E "16," | sort -n | cut -d , -f 2 | head -n 1)
VARGRAD=$(echo "$val2 - $val1" | bc)

# to print tasks 2 and 3
echo "highest earner: $VARHIGH
lowest earner: $VARLOW
number of females in top 10: $VARFEM
college grad wage difference: $VARGRAD"
