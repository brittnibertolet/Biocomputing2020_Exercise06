# This is the shell script for Homework 6
# Worked on by Laura Carroll and Melissa Pirko
# Usage: bash Homework6.sh filename

# Part 1
cat "$1" | grep "male" | cut -d , -f 1,2 | sort -V | uniq | tr "," " " > genderExperience.txt

# Part 2

