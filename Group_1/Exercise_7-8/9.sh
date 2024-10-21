#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_filename> <output_filename>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the provided input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: The specified input file does not exist!"
    exit 1
fi

while read -r line; do
    if [[ ! "$line" =~ ^[0-9]+$ ]]; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"

exit 0