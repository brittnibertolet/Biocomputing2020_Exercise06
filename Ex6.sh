# Shell script which does the following:
# 1.) writes a file containing the unique gener-yearsExperience combinations in the file "wages.csv"
# 2.) Returns the following to stdout upon execution:
#    - The gender, yearsExperience, and wage for the highest earner
#    - The gender, yearsExperience, and wage for the lowest earner
#    - The number of females in the top ten earners in this dataset

# Task #1:
cat wages.csv | cut -d, -f 1,2 | sort -t, -k1,1 -k2,2n | tr "," " " | uniq > gender_Exp_Sorted.txt 

# Task #2:
echo "Highest earner"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 | tail -n 1
echo "Lowest earner"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 | head -n 2 | tail -n 1
echo "Top ten female earners"
cat wages.csv | cut -d, -f 1,2,4 | sort -t, -n -k3 -r | head -n 10 | grep -c "female"
