# Cut out gender and yearsExperience columns from wages.txt and sort unique
# tab separated values into new file and remove column names 

cat wages.csv | cut -f 1,2 -d, | sort | uniq | tr "," " " | sed '/gender yearsExperience/d' >> gender_Exp_only.txt

