#!/bin/bash

# Parse command line options using case statement
while getopts ":dwlh" option; do
    case "${option}" in
        d)
            date
            ;;
        w)
            whoami
            ;;
        l)
            ls -l ~
            ;;
        h)
            echo "Usage: $0 [-d] [-w] [-l] [-h]"
            echo "Options:"
            echo "  -d: Run the date command"
            echo "  -w: Print the logged in username"
            echo "  -l: List the logged in user's folder content"
            echo "  -h: Print help message"
            ;;
        *)
            # If an invalid option is provided, print error message and help
            echo "Error: Invalid option"
            echo "Usage: $0 [-d] [-w] [-l] [-h]"
            exit 1
            ;;
    esac
done

# If no options are provided, print help message
if [ $OPTIND -eq 1 ]; then
    echo "Error: No options provided"
    echo "Usage: $0 [-d] [-w] [-l] [-h]"
    exit 1
fi

# Shift the options so that remaining arguments can be processed if needed
# $OPTIND is used to check if any options were provided (when it's equal to 1, meaning no options were processed) 
shift $((OPTIND-1))

# getopts is a built-in Bash command used for parsing command-line options (flags) and arguments. 
# It processes short options (single-character options preceded by a hyphen) and their associated values.

# getopts processes the command-line options, it uses $OPTIND to keep track of the index of the next argument that needs to be processed. 
# After processing the options, $OPTIND will point to the next positional parameter, which can be accessed using shift $((OPTIND-1)).
