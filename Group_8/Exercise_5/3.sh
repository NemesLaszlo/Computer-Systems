#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory_path> <search_word>"
    exit 1
fi

# Get directory path and search word from arguments
directory_path="$1"
search_word="$2"

# Find command to search for files containing the search word
find "$directory_path" -type f -exec grep -l "$search_word" {} +

# -type f means that it will search for regular files (not directories or other types of files).
# -exec: This option is used to execute a command for each file that matches the criteria.
# grep -l This is the command that will be executed for each matching file (-l: This is an option for grep that tells it to only print the names of files that contain the search word, not the actual matching lines.)
# {}: This is a placeholder that represents the current file being processed by find. For each matching file, {} will be replaced with the file's path.
# +: This signifies the end of the -exec command. It tells find to execute the specified command