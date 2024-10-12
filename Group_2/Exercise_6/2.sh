#!/bin/bash

# Create a temporary file to store words
temp_file=$(mktemp)

# Function to clean up and exit
cleanup_and_exit() {
    echo "List of previous words:"
    cat "$temp_file"
    
    # Remove the temporary file
    rm -f "$temp_file"
    
    exit 0
}

# Read words from the user until "vége" is entered
while true; do
    read -p "Enter a word: " word
    if [ "$word" == "vége" ]; then
        cleanup_and_exit
    else
        echo "$word" >> "$temp_file"
    fi
done
