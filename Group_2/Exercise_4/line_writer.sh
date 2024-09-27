#!/bin/bash

echo Takes two parameters: the first parameter indicates the number of times to print the second parameter to the terminal

# Check if two parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number of times> <text>"
    exit 1
fi

# Extract parameters
times=$1
text=$2

# Loop to print the text the specified number of times
for ((i=0; i<times; i++)); do
    echo "$text"
done