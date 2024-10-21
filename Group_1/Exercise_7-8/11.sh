#!/bin/bash

# Prompt the user to enter a number
echo "Enter a number:"
# Read the number from the user
read number

sum=0

for (( i=0; i<${#number}; i++ )); do
    digit="${number:$i:1}"
    sum=$((sum + digit))
done

echo "Sum of digits: $sum"

exit 0
