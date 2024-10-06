#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_name> <search_word>"
    exit 1
fi

# Get file name and search word from arguments
file_name="$1"
search_word="$2"

# Grep command to find lines containing the search word in the file
# -i -> Ignores, case for matching
grep -i "$search_word" "$file_name"