# This function library is to be used in BASH

# getDate function checks the month and date of the file created/edited
getDate(){

	local FILE=$1
	local OPT=$2
	local TIMESTAMP=$(stat --format '%y' $FILE)


        YEAR=${TIMESTAMP%%-*}
        TIMESTAMP_=${TIMESTAMP#*-}
        MONTH=${TIMESTAMP_%%-*}
        TIMESTAMP__=${TIMESTAMP_#*$MONTH}
        DAY_=${TIMESTAMP__#*-}
	DAY=${DAY_%% *}

	if [ -z $OPT ]; then
		echo "$TIMESTAMP"
	else
	
		case $OPT in
			all) echo "$YEAR $MONTH $DAY";;
			year) echo "$YEAR" ;;
			month) echo "$MONTH" ;;
			day) echo "$DAY" ;;
		esac
	fi

# Usage example: getDate file-0.txt day
}


# makeDir function creates a directory and one subdirectory. 
# (For example, it could  make directories of month and date 
# according to what's written in a file's timestamp using 
# getDate function.)
makeDir(){

        local DIR1="$1"
        if [ ! -d $DIR1 ]; then
        mkdir $DIR1
        fi

        local DIR2="$2"
        if [ ! -d $DIR1/$DIR2 ]; then
        mkdir $DIR1/$DIR2
        fi

}

# copyFile function copies files into a directory
copyFile(){
	local FILE=$1
	local DIR=$2
	cp $FILE $DIR 

}

# moveFile function moves files into a directory
moveFile(){
	local FILE=$1
	local DIR=$2
	mv $FILE $DIR

}

# This cleanUp function is specified to trap control-c.
cleanUp(){
        echo "control-c entered. Exiting the script and deleting a temporary file"
        rm -r $TEMPVAR 2> /dev/null
        exit 1
}

# This printSyntax fuction shows a syntax for using the shell script.
printSyntax(){
	echo "Syntax: $0 <option> <argument> "
	exit 1
}


