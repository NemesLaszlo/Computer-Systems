#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

# Get file name from argument
file_name="$1"

# Check if the file exists
if [ ! -f "$file_name" ]; then
    echo "File '$file_name' not found."
    exit 1
fi

# Change all letters in the file to uppercase
tr '[:lower:]' '[:upper:]' < "$file_name" > "$file_name.tmp"

# Overwrite the original file with the uppercase content
mv "$file_name.tmp" "$file_name"

echo "All letters in '$file_name' have been changed to uppercase."