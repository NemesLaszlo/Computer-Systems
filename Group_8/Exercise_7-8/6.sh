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

while read -r number; do
    if [[ $number =~ ^[0-9]{2}$ ]]; then
        reversed_number=$(echo "$number" | rev) # Reverse the digits
        echo "$reversed_number"
    fi
done < "$file"

exit 0
