#!/bin/bash

# Check if a file parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file_name=$1;

# Check if the provided file exists
if [ ! -f "$file_name" ]; then
    echo "File does not exist!"
    exit 1
fi

count=0

while IFS= read -r line; do
    # Check if the line contains only alphabetic characters and spaces
    #
    # [ "$line" =~ ^[[:alpha:][:space:]]+$ ]] -> [[ "$line" =~ ^[[:alpha:][:space:]]+$ ]]: This uses a regular expression to check 
    #   if the line contains only alphabetic characters ([:alpha:]) and spaces ([:space:])
    #
    # ^ and $: Anchors to ensure the match is for the entire line (It has been said many times, let's say it again)
    if [[ "$line" =~ ^[[:alpha:][:space:]]+$ ]]; then
        count=$((count+1))
    fi
done < "$file_name"

# Other solution option:
# count=$(grep -c '^[[:alpha:][:space:]]*$' "$1")

echo "There are $count lines in the file that contain only characters."


exit 0