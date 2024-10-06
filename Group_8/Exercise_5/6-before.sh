#!/bin/bash

declare -A counts
# declare: This keyword is used to set attributes for variables in Bash. When used with -A, it declares an associative array.

words=("apple" "banana" "apple" "orange" "banana" "apple")

# Count word frequencies
for word in "${words[@]}"; do
    counts["$word"]=$(( counts["$word"] + 1 ))
done

# Print word frequencies
# # The syntax "${!counts[@]}" retrieves all the keys in the array (associative)
for word in "${!counts[@]}"; do
    echo "Word: $word, Frequency: ${counts["$word"]}"
done
