#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_file>"
    exit 1
fi

# Get source and destination file names from arguments
source_file="$1"
destination_file="$2"

# Check if the destination file exists
if [ -e "$destination_file" ]; then
    # Copy the content of the source file to the destination file
    cp "$source_file" "$destination_file"
    echo "Content copied from '$source_file' to '$destination_file'."
else
    # If the destination file does not exist, create an empty destination file
    touch "$destination_file"
    echo "Destination file '$destination_file' does not exist. Created an empty destination file '$destination_file'."
    cp "$source_file" "$destination_file"
fi