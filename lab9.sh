#!/bin/bash

while getopts :dvhn:l: opt ;do

	case $opt in
	d) set -x ;;
	v) VERBOSE=TRUE ;;
	h) echo "Help Message: 
	Script name: lab9
	Syntax: lab9.sh <option> <arguments>
	Options: -d turns on debugging
	         -v make the script verbose
	 	 -h prints out this help message
		 -n <arg> takes a name argument and prints a message 
		 -l <arg> have it list the directory using a for loop or ls
		 Any other options would prints this help message and exit" ;;
		
	n) ARGUMENT="$OPTARG"; echo "$ARGUMENT";;
	l) ARGUMENT="$OPTARG"
	   echo "Would you like to see a list of directory/file inside the $ARGUMENT?" 
	   read INPUT 
	 	case $INPUT in
		Y | y) echo "$(ls $OPTARG)";;
		
		N | n) exit 1;;
		esac
	;; 
	*)echo "$1 is an invalid option. Refer to the help message below." 
 	  echo "$(./lab9.sh -h)" ;; 

	esac
done

shift $(( $OPTIND - 1 ))

echo 
COUNT=1
for PARAM in "$@"; do
	echo "Parameter $COUNT: $PARAM"
	COUNT=$[ $COUNT + 1 ]
done
