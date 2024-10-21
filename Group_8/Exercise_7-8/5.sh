#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <filename> <word_to_replace> <replacement_word>"
    exit 1
fi

file="$1"
word_to_replace="$2"
replacement_word="$3"

# Check if the provided file exists
if [ ! -f "$file" ]; then
    echo "Error: The specified file does not exist!"
    exit 1
fi

# Perform the replacement and save the changes to a temporary file
sed "s/\b$word_to_replace\b/$replacement_word/g" "$file" > temp_file.txt
# sed: The stream editor command, used to perform text manipulation
# s/.../.../g: The substitution command in sed. It replaces all occurrences of a pattern with a replacement string. The g flag at the end means "global," meaning all occurrences in each line will be replaced
# \b$word_to_replace\b here -> \b: This is a word boundary anchor in regular expressions. It ensures that the $word_to_replace is matched as a whole word, not part of another word


# Replace the original file with the temporary file containing the changes
mv temp_file.txt "$file"

echo "Word '$word_to_replace' replaced with '$replacement_word' in the file."

exit 0
