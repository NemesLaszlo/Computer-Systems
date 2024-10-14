#!/bin/bash

# Check if a file parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

input_file="$1"
even_lines_file="even_lines.txt"
odd_lines_file="odd_lines.txt"

# Initialize line number counter
line_number=1

# Read the input file line by line and sort into even and odd lines
while IFS= read -r line; do
    if [ $((line_number % 2)) -eq 0 ]; then
        echo "$line" >> "$even_lines_file"
    else
        echo "$line" >> "$odd_lines_file"
    fi
    line_number=$((line_number + 1))
done < "$input_file"

# If the last line is odd, add it to the odd file
if [ $((line_number % 2)) -eq 1 ]; then
    echo "$line" >> "$odd_lines_file"
fi

# If the last line is even, add it to the even file
if [ $((line_number % 2)) -eq 0 ]; then
    echo "$line" >> "$even_lines_file"
fi

# In the while loop, the read command reads the file line by line, and after reading the last line,
# the loop terminates. However, if the last line does not have a newline character at the end, the shell will treat it as an incomplete line, 
# and the final read might fail to trigger the loop body.

# The condition || [ -n "$line" ] ensures that if the last line doesn't end with a newline, it's still processed.

# line_number=1
# while IFS= read -r line || [ -n "$line" ]; do
#     if [ $((line_number % 2)) -eq 0 ]; then
#         echo "$line" >> "$even_lines_file"
#     else
#         echo "$line" >> "$odd_lines_file"
#     fi
#     line_number=$((line_number + 1))
# done < "$input_file"

echo "Sorted even lines are stored in $even_lines_file"
echo "Sorted odd lines are stored in $odd_lines_file"
