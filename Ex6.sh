#This is the script for part 1 of exercise 6
#Write a file containing the unique gender-yearsExperience combinations in file wages.csv
#File created should contain gender in first column and yearsExperience in a second column, space separating columns
#Rows should be sorted first by gender, then by yearsExperience, keep pairings in a given row intact
#Don't worry about column names in output file

#steps:
#cat wages.csv
#4 columns total, we just want the first two (gender, yearsExperience)
#also csv is comma separated, so we need to make this space separated instead I think?
#sort by gender, then by years experience --> test to see if/how to keep the pairs intact?
#output to gender-yearsExperience.txt file




#This is the script for part 2 of exercise 6. 
#This script must do 3 things 1) display data (gender, years experience, and wage) for highest earner 
# 2) dislay the same data for the lowest earner and 3)display the number of females in the top 10 wage earners

echo -n "Highest Earner: " 
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | tail -n 2 | head -n 1
echo -n "Lowest Earner: " 
cat wages.csv | cut -d , -f 1,2,4 | sort -t , -k 3 | head -n 1
echo -n "Number of Top 10 Earners Who are Women: " 
cat wages.csv | sort -r  -t , -k 4 | head -n 11 |grep  "female" |wc -l



#This is the script for part 3 of exercise 6
#Return to stdout: the effect of graduating college (12 vs 16 years of school) on the minimum wage for earners in this dataset
#Hint 1: You can assign the output of a pipeline to a variable w/code: 
