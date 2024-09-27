#!/bin/bash

echo The script counts the number of lines that contain only numbers and end with 1
if [ $# -ge 1 ]
then

cat $1 | grep -E ^[\+-]?[1-9][0-9]*[,/.]?[0-9]*1$ | wc -l

else
    echo Not enough parameters
fi