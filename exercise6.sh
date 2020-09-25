#Creator: Corbyn Carlson
#Date: 9/24/2020
#First, this script writes a file with all of the paired gender and yearsExperience from the file wages.csv. #In part two (still using wages.csv), it first returns the highest earner’s gender, yearsExperience, and wage to standard out; then it returns the lowest earner’s gender, yearsExperience, and wage to standard out; and finally it returns the number of females in the top ten highest-earning individuals to standard out.                                                                                                                                                                 #In part three, the difference in minimum wage between individuals who completed and did not complete college is displayed in standard out.
#usage: bash script.sh wages.csv

#Part 1
#This first section is a pipeline that concatenates the file, sorts it first based on gender (column 1) then numerically based on yearsExperience (second column), cuts out these two columns, and replaces all instances of ‘male,’ and female,’ with ‘male ‘ and ‘female ‘ respectively. A file named ‘genderExperience.txt’ is then created and will show a list of all pairings of gender and yearsExperience, organized by gender and then the number of yearsExperience within each gender. 
#The $1 refers to ‘wages.csv’

cat $1| sort -t, -k1,1 -k2,2n | cut -d , -f1,2| sed 's/male\,/male /g;s/female\,/female /g' > genderExperience.txt


#Part 2
#This is the second section, which first returns the highest earner’s gender, yearsExperience, and wage to standard out; then it returns the lowest earner’s gender, yearsExperience, and wage to standard out; and finally it returns the number of females in the top ten highest-earning individuals to standard out.  
#The $1 refers to ‘wages.csv’

#This pipeline concatenates the file, then sorts it numerically by wage from smallest to biggest, keeps the last two lines (the bottom of which is the column titles), then keeps the first of these two lines, and puts the gender, yearsExperience, and wage columns from this line into standard out.                                                                                       
cat $1 | sort -t, -k4 | tail -n 2 | head -n 1 | cut -d , -f1,2,4
#This pipeline concatenates the file, then sorts it numerically by wage from smallest to biggest, keeps the top line, and puts the gender, yearsExperience, and wage columns from this line into standard out.                                                                                       
cat $1 | sort -t, -k4 | head -n 1 | cut -d , -f1,2,4
#This pipeline concatenates the file, then sorts it numerically by wage from smallest to biggest, keeps the bottom 11 lines, keeps the top ten of these lines (corresponding to the individuals with the top ten wages), looks for all lines with the word ‘female’ in them, counts the number of lines in which the word ‘female’ appears, and then puts this number into standard out.                                                                                       
cat wages.csv | sort -t, -k4 | tail -n 11 |head -n 10 | grep -o -i female | wc -l

#Part 3 
#The first pipeline looks for the lines with values of 12 in the yearsSchool column of the file 
#(wages.csv), sorts them numerically from least to greatest values in the wages column, keeps the line with the 
#lowest wage value (the top line), and then cuts the wage value from this line and brings it to standard out
#(the top line), and then cuts the wage value from this line and brings it to standard out. The resulting value is then assigned to the variable no college
#The second pipeline looks for the lines with values of 16 in the yearsSchool column of the file (wages.csv), sorts them numerically from least to greatest values in the wages column, keeps the line with the lowest wage value (the top line), and then cuts the wage value from this line and brings it to standard out. The resulting value is then assigned to the variable college 
#The final line subtracts the minimum wage from people who graduated college from the minimum wage of people who did not graduate college and displays this difference in the standard out

nocollege=$(grep -E "\,[0-9]{1,2}\,12\," $1 | sort -t, -k4,4n | head -n 1 | cut -d , -f4)
college=$(grep -E "\,[0-9]{1,2}\,16\," $1 | sort -t, -k4,4n | head -n 1 | cut -d , -f4)
echo "$college - $nocollege" | bc

