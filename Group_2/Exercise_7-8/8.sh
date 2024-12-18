#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file="$1"

# Check if the provided file exists
if [ ! -f "$file" ]; then
    echo "Error: The specified file does not exist!"
    exit 1
fi

sum=0

while read -r number; do
    if [[ "$number" =~ ^[0-9]+$ ]]; then
        sum=$((sum + number)) # Add the number to the sum
    else
        echo "Warning: Skipping invalid number on line: $number"
    fi
done < "$file"

echo "Sum of numbers in the file: $sum"

exit 0
