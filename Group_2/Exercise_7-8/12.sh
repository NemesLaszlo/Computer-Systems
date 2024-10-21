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

# Read lines from the file into an array
lines=()
while IFS= read -r line; do
    lines+=("$line")
done < "$file"

# Reverse the lines in the array
# The last line of the file is an empty line, we don't want to start the parsing with an empty line, so we pay attention to this with -1.
reversed_lines=()
for ((i=${#lines[@]}-1; i>=0; i--)); do
    reversed_lines+=("${lines[i]}")
done

# Write the reversed lines back to the file
printf "%s\n" "${reversed_lines[@]}" > "$file"

echo "Lines in the file have been reversed."

exit 0
