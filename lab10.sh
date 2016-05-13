#!/bin/bash

TEMPVAR=$(mktemp lab10temp.XXXX)
ALLDIRS=$(ls -R /)
COUNT=1


CLEANUP(){
echo "control-c entered. Exiting the script and deleting a temporary file"
rm -r $TEMPVAR 2> /dev/null
exit 1
}

trap CLEANUP SIGINT

for LINE in $ALLDIRS; do
       	echo "File $COUNT: $LINE" >> $TEMPVAR
        COUNT=$[ $COUNT + 1]

done
