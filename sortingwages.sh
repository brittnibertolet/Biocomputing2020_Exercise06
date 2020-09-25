#usage: bash sortingwages.sh
#output will create 2 colums with gender and yearsExperience separated by space

cat wages.csv | cut -d , -f 1,2 | sort -t, -k1,1 -k2,2n | tr ',' ' ' 
