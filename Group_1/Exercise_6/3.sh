#!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [number1] [number2] ... [number10]"
    echo "Add up to 10 numbers and print the result."
    exit 1
}

# Check for help option
if [ "$1" == "-h" ]; then
    display_help
fi

# Check if there are no parameters
if [ "$#" -eq 0 ]; then
    echo "Error: No numbers provided. Use -h for help."
    exit 1
fi

# Initialize sum to 0
sum=0

# Loop through parameters and add them to the sum
for number in "$@"; do
    sum=$((sum + number))
done

# Print the result
echo "Sum of the numbers: $sum"
