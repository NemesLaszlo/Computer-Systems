#!/bin/bash

function F1()
{
    echo 'This is a function'
}

F1

# ---

Rectangle_Area() {
area=$(($1 * $2))
echo "Area is : $area"
}

Rectangle_Area 10 20
