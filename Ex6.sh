#This is the script for part 1 of exercise 6
#Write a file containing the unique gender-yearsExperience combinations in file wages.csv
#File created should contain gender in first column and yearsExperience in a second column, space separating columns
#Rows should be sorted first by gender, then by yearsExperience, keep pairings in a given row intact
#Don't worry about column names in output file


sort -t, -k1,1 -k2,2n wages.csv | cut -d, -f1,2 | tr ',' ' ' >> "gender-yearsExperience.csv"





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
# CS: I think you have to cut it so only the salary is stored under the variable?
#AZ: Good call!
cat wages.csv | sort -n -t , -k 3 | tail -n 16 | sort -n -t , -k 4 | head -n 1 | cut -d, -f4 


#To return the minimum wage for highschool gradutes (12 years of education).You can use the cut function to only show columns  3 and 4 (leaving in column 2 makes it difficult to use grep). Then using grep we can isolate the subset of those with 12 years of education. The special character ^ allows us to eliminate matches in column 4
cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -n -t , -k 2 | head -n 1

# CS: And again here? If that's right? I'm not 100% I'm answering the right question.
# We want college earners min - high school earners min right?
#AZ: I think so. 
cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -n -t , -k 2 | head -n 1 | cut -d, -f2  


# Hm I was getting this error before I added the little cut thing at the end, and I'm still getting it now...
# I'm working in the Biocomputing2020_Exercise06 folder which has wages.csv when I ls
# AZ: I think you need a ( between the  $ and  the 'cat'  so  college_earnings=$(cat wages.csv
# AZ: When I added (  ) I didn't get the error, but I have been having issues getting the $val1 - $val2 | bc thing to work. IF you could go to office hours, that would be awesome! I have to TA a lab today and it overlaps unfortunately. 
chelseas-air:Biocomputing2020_Exercise06 Chelsea$ college_earnings=$cat wages.csv | sort -n -t , -k 3 | tail -n 16 | sort -n -t , -k 4 | head -n 1 | cut -d, -f4
-bash: wages.csv: command not found

#I think we ideally want:

college_earners=$(cat wages.csv | sort -n -t , -k 3 | tail -n 16 | sort -n -t , -k 4 | head -n 1 | cut -d , -f 4)
hs_earners=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -n -t , -k 2 | head -n 1 | cut -d , -f 2)
"$college_earners - $hs_earners" | bc

#CS: This worked for me! I googled and found a solution? If you could double check this and my code for #1 that would be great, I checked #2 and it looks good!
college_earners=$(cat wages.csv | sort -n -t , -k 3 | tail -n 16 | sort -n -t , -k 4 | head -n 1 | cut -d , -f 4)
hs_earners=$(cat wages.csv | cut -d , -f 3,4 | grep -E "^12" | sort -n -t , -k 2 | head -n 1 | cut -d , -f 2)
difference=$(bc <<< "$college_earners - $hs_earners")
echo $difference
10.0251729992

