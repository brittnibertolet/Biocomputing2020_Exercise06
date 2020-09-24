# usage: bash Gitassignment.sh 

# Puts unique gender and yearsExperience into a new file

cat wages.csv | sort -u -t , -k 1,2 | sort -t , -k 1,1 -k 2,2n | grep -v "gender" | cut -d , -f 1,2 | tr "," " " > genderexperience.txt

# Lists gender, yearsExperience, and wage for lowest earner in stdout

echo "lowest earner"
cat wages.csv | sort -n -k4 -t , | cut -d , -f 1,2,4 | head -n 2 | tail -n 1

# Lists gender, yearsExperience, and wage for highest earner in stdout

echo "highest earner" 
cat wages.csv | sort -n -k4 -t , -r | cut -d , -f 1,2,4 | head -n 1

# Lists number of females in top ten earners

echo "number of females in top ten earners"
cat wages.csv | sort -n -k4 -t , -r | head -n 10 | grep -c "fe"

#Outputs the effect of graduating college (12 years in school vs 16 years)

cat wages.csv | grep 16 | cut -d "," -f 4 | 
