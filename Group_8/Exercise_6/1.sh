#!/bin/bash

# Check if the number of arguments is 1
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Read the number from the first argument
number=$1
factorial=1

# Calculate factorial
for (( i=1; i<=number; i++ )); do
    factorial=$((factorial * i))
done

echo "Factorial of $number is: $factorial"
