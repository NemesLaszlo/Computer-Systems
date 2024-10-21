#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filename> <search_word>"
    exit 1
fi

file="$1"
search_word="$2"

# Check if the provided file exists
if [ ! -f "$file" ]; then
    echo "Error: The specified file does not exist!"
    exit 1
fi

while IFS= read -r line; do
    if [[ "$line" != *"alma"* && "$line" != *"körte"* && "$line" != *"$search_word"* ]]; then
        echo "$line"
    fi
done < "$file"

exit 0
