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
	#
#output to gender-yearsExperience.txt file

# so my notes say use cut, and -f 2 to get first two columns, -d for comma delimited
#but im getting thisESCs-iMac-3:Biocomputing2020_Exercise06 archielab$ cat wages.csv | cut -d -f 2 wages.csv
#cut: bad delimiter
#ESCs-iMac-3:Biocomputing2020_Exercise06 archielab$ cut -d -f 2 wages.csv
#cut: bad delimiter
#I'm going to go to office hours on Tuesday...I've tried a lot of variations of this and googling without success yet






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

#To return the  minimum wage for college graduates (16 years of education). First sort by column 3 (years of education) and use the tail function to isolate those with college degrees. Now that only those with college degrees are in standard out sort again by column 4 (wage) to identify the lowest earner. 
cat wages.csv | sort -n -t , -k 3 | tail -n 16 | sort -n -t , -k 4 | head -n 1

# I think the above needs to be stored as a variable, but when I tried the syntax the Exercise provided, I couldn't do the "bc" math part

#To return the minimum wage for highschool gradutes (12 years of education).You can use the cut function to only show columns  3 and 4 (leaving in column 2 makes it difficult to use grep). Then using grep we can isolate the subset of those with 12 years of education. The special character ^ allows us to eliminate matches in column 4
cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -n -t , -k 2 | head -n 1  

