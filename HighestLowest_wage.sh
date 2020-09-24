# Returns to sd out: gender, yearsExpe- rience, and wage for the highest earner and lowest earner, number of females in top 10

#Lowest wage
for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | cut -f 1,2,4 -d, | head -n2
done

# Highest wage
for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | cut -f 1,2,4 -d, | tail -n1
done

#Number of females in top 10 earners
for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | head -n11 | grep -o "female" | wc -l  
done

