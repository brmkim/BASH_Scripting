#!/bin/bash

echo "Please enter an integer number between 50 and 100:"
read INPUT

NUMBER=$(echo $INPUT | grep [[:digit:]])
NOZERO=$(echo $NUMBER | sed 's/^0*//')
# NUM=$(( 10#$NUM )) <---- cleaning to decimal numbers, clear the  octals 

if [[ ${NOZERO%.*} -ge 50 ]] && [[ ${NOZERO%.*} -le 100 ]]; then
	echo "Thank you. Your number is ${NOZERO%.*}."
else
	echo "Please enter an integer between 50 and 100!"
fi

# abolve is using IF CONDITIONALS
# since the conditions deals with numbers, one could use ARITHMATIC CONDITIONLAS too (shown below).
# if (( NUM > 50 < 100 }}; then
# ..etc


