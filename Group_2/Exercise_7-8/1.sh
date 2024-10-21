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

# =~ -> comparing and matching strings with regular expressions
# This regex does not cover all edge cases, that would be more correct -> ^[+-]?((\d+(\.\d*)?)|(\.\d+))$, but this is not expected now
while IFS= read -r line || [ -n "$line" ]; do
    if [[ $line =~ ^[+-]?[0-9]*[.]?[0-9]+$ ]]; then
        echo "$line"
    fi
done < "$file_name"

exit 0
