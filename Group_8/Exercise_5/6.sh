#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

declare -A month_counts
declare -A max_illness_counts
declare -A max_illness_values

# Read file line by line and split the line values by commas
while IFS= read -r line; do
    # Split the line values by commas
    IFS=',' read -r -a values <<< "$line"
    
    # Check if there are at least 3 values in the line
    if [ "${#values[@]}" -ge 3 ]; then
        # Extract month from the second date value
        second_value_date=$(echo "${values[1]}" | tr -s '[:space:]')
        month=$(date -d "$second_value_date" +%m)
        
        # Extract and count illness
        third_value=$(echo "${values[2]}" | tr -s '[:space:]')
        illness_count=$(echo "$third_value" | tr -d '[:punct:]' | tr ' ' '\n' | grep -v "^$" | grep -c -w -e '\w\{1,\}')
        # tr -d '[:punct:]' delete all punctuation characters from the input text (such as periods, commas, exclamation marks, question marks, and other special characte)
        # tr ' ' '\n' replace all spaces (' ') in the input text with newline characters ('\n')
        # grep -v "^$" command is used to exclude empty lines from the input
        # grep -c -w -e '\w\{0,\}' matches 1 or more word characters

        # Count the occurrences of third_value for every month
        month_counts["$month:$third_value"]=$((month_counts["$month:$third_value"] + illness_count))
    fi
done < "$1"

# Find the maximum illness count and its corresponding third value for each month
# The syntax "${!month_counts[@]}" retrieves all the keys in the array (associative)
for key in "${!month_counts[@]}"; do
    # ${key%%:*} means: take the key and remove everything after the first colon (:) to get the month
    month=${key%%:*}
    # ${key#*:} means: remove everything up to and including the first colon (:) from the key
    third_value=${key#*:}
    count=${month_counts["$key"]}

    # Check if the current count is greater than the stored maximum for the month
    # ${max_illness_counts[$month]:-0} uses a default value of 0 if there is no entry for the month yet
    # (This prevents an error when comparing counts for a month that hasn't been processed yet)
    if [ "$count" -gt "${max_illness_counts[$month]:-0}" ]; then
        max_illness_counts["$month"]=$count
        max_illness_values["$month"]=$third_value
    fi
done

# Print the maximum illness count and its corresponding third value for each month
for month in "${!max_illness_counts[@]}"; do
    echo "Month: $month, Max Illness Count: ${max_illness_counts[$month]}, Corresponding Third Value: ${max_illness_values[$month]}"
done
