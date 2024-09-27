#!/bin/bash

string1="ELTE "
string2="IK"
echo "$string1$string2"
string3="${string1}${string2}"
string3+=" University"
echo $string3