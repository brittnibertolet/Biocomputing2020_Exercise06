# Returns to sd out: gender, yearsExpe- rience, and wage for the highest earner and lowest earner, number of females in top 10

for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | cut -f 1,2,4 -d, | head -n2
done

for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | cut -f 1,2,4 -d, | tail -n1
done

for file in "wages.csv"
do
cat "$file" | sort -t, -k4,4 -n | head -n10 | grep -o "female" | wc -l  
done

