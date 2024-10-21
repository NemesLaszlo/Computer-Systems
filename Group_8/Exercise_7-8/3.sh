#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_file> <destination_file> <search_word>"
    exit 1
fi

source_file="$1"
destination_file="$2"
search_word="$3"

# Check if the source file exists
if [ ! -f "$source_file" ]; then
    echo "Error: The provided source file does not exist!"
    exit 1
fi

# Check if the destination file exists, create it if not
if [ ! -f "$destination_file" ]; then
    touch "$destination_file"
fi

# The * is a wildcard character in shell patterns. It matches any sequence of characters (including an empty sequence).
while IFS= read -r line; do
    if [[ "$line" != *"$search_word"* ]]; then
        echo "$line" >> "$destination_file"
    fi
done < "$source_file"

exit 0
