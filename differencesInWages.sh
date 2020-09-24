#usage: bash differencesInWages.sh wages.csv

#Minimum College Wage
MinCollegeWage=$(cat wages.csv | cut -d "," -f 3,4 | egrep "^[1]{1}[6]{1}," | tr , " " | sort -k2,2r | tail -n 1 | cut -d " " -f 2)

#Minimun High School wage
MinHighSchoolWage=$(cat wages.csv | cut -d "," -f 3,4 | egrep "^[1]{1}[2]{1}," | tr , " " | sort -k2,2r | tail -n 1 | cut -d " " -f 2)

Difference=$(echo "$MinCollegeWage-$MinHighSchoolWage" | bc)

echo The difference in minimum wages between people who graduated college and highschool is $Difference.
