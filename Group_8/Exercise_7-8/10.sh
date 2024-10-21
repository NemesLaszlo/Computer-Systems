#!/bin/bash

# Prompt the user to enter a number
echo "Enter a number:"
# Read the number from the user
read number

# Reverse the number using rev command
reversed_number=$(echo "$number" | rev)

echo "Reversed number: $reversed_number"

exit 0
