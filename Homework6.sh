# This is the shell script for Homework 6
# Worked on by Laura Carroll and Melissa Pirko
# Usage: bash Homework6.sh filename

# Part 1
cat "$1" | grep "male" | cut -d , -f 1,2 | sort -V | uniq | tr "," " " > genderExperience.txt

# Part 2
#1) Concatenates wages.csv, then sorts based on the comma delimiter and orders 
#from lowest to highest based on the 4th column, wages, then obtains the
#bottom value, which is the greatest wage, then cuts based on the comma 
#delimiter columns 1, 2, and 4 which is gender, years experience, and wage

cat "$1" | grep "male" | sort -t"," -k4 | tail -n1 | cut -d"," -f 1,2,4

#2) Concatenates wages.csv, then sorts based on the comma delimiter and orders
#from lowest to highest based on the 4th column, wages, then obtains the top
#two values, which is the header and the lowest wage, then obtains the lowest of
#these two rows, which is the lowest wage, then cuts based on the comma 
#delimiter columns 1, 2, and 4 which is gender, years experience, and wage

cat "$1" | sort -t "," -k4 | head -n2 | tail -n1 | cut -d"," -f 1,2,4

#3) Concatenates wages.csv, then sorts based on the comma delimiter and orders
#from lowest to highest based on the 4th column, wages, then obtains the 
#bottom 10 values, which are the top 10 highest wages, then finds which of the
#10 are females and displays their stats 

cat "$1" | sort -t "," -k4 | tail -n10 | grep -w "female"

# Part 3
#Sets shell script as variable MinimumCollege Wage, which concatenates 
#wages.csv, then sorts based on the comma delimiter and based off the 4th 
#column, wages, and then cuts based on the comma delimiter for columns three
#and four, which are the years of school and wage, then only displays the data
#with 16 years of school, then looks for the value at the top, which is the 
#lowest wage for someone with 16 years of schooling or a college degree, then
#cuts the second value, which is their wage

MinimumCollegeWage=$(cat "$1" | sort -t "," -k4 | cut -d "," -f 3,4 | grep -w "16" | head -n1 | cut -d "," -f 2)

#Sets shell script as variable MinimumHighSchoolWage, which concatenates
#wages.csv, then sorts based on the comma delimiter for columns three and 
#four, which are the years of school and wage, then only displays the data with 12 years of school, then looks for the value at the top, which is the
#lowest wage for someone with 12 years of schooling or a high school degree, 
#then cuts the second value, which is their wage

MinimumHighSchoolWage=$(cat "$1" | sort -t "," -k4 | cut -d "," -f 3,4 | grep -w "12" | head -n1 | cut -d "," -f 2)

#Repeats the values obtained from MinimumCollegeWage and MinimumHighSchoolWage
#with a minus sign between them and calculates this value and outputs it

echo "$MinimumCollegeWage - $MinimumHighSchoolWage" | bc
