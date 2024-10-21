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

while read -r line; do
    # Split the line into two words using space as the delimiter
    #
    # The awk command is a powerful text-processing tool in Unix-like systems that allows you to manipulate, 
    # search, and analyze text in structured data such as files or streams. It works by processing each line of input and 
    # applying operations or pattern-matching logic based on fields within those lines
    #
    # Basic syntax: awk 'pattern {action}' file
    #
    # awk '{print $1}': Extracts the first word ($1) from the line.
    # awk '{print $2}': Extracts the second word ($2) from the line.
    word1=$(echo "$line" | awk '{print $1}')
    word2=$(echo "$line" | awk '{print $2}')
    
    # Swap the words and print the result
    echo "$word2 $word1"
done < "$file"

exit 0
