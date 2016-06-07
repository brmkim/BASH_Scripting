#!/bin/bash
# What this script does:
# 1. looks at the modified timestamp of each file in timefiles
# 2. creates a directory structure for the month and day in timefiles directory
# 3. copies each file to the appropriate directory
# 4. moves each file to the appropriate directory if -f (force) is set

ACTION="COPY"

while getopts :dvhf opt ;do

        case "$opt" in
        d) set -x ;;
        v) VERBOSE=TRUE ;;
        h) echo "Help Message:
        Script name: lab11
        Syntax: lab11.sh <option> <arguments>
        Options: -d turns on debugging
                 -v make the script verbose
                 -h prints out this help message
                 -f moves files to folders instead of copyig (default)" ;;

        f) ACTION="MOVE" ;;
        *)echo "$1 is an invalid option. Refer to the help message below."
          echo "$(./lab11.sh -h)" ;;
        esac

shift $(( $OPTIND - 1 ))

done

trap cleanUp SIGINT

source /root/functionlibrary.sh

FILEPATH="$1"

if [ -z $FILEPATH ]; then
	printSyntax
	exit 1
fi

LIST=$(ls "$FILEPATH")


for ITEM in $LIST; do
	MONDIR=$(getDate "$FILEPATH"/"$ITEM" month)
	DAYDIR=$(getDate "$FILEPATH"/"$ITEM" day)

	makeDir "$MONDIR" "$DAYDIR"



	if [ $ACTION == "MOVE" ]; then
		moveFile "$FILEPATH"/"$ITEM" "$MONDIR"/"$DAYDIR"
	else
		copyFile "$FILEPATH"/"$ITEM" "$MONDIR"/"$DAYDIR"
	fi
done

