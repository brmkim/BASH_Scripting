#!/bin/bash

MXML=$(awk '/filename/' /root/medialab/media.xml | awk -F">" '{print $2}' | awk -F"<" '{print $1}' | sort -u)
C1="0"
C2="0"

echo "Files not in media.xml:" 
for i in $(ls /root/medialab/); do
	if cat /root/medialab/media.xml | grep -q "$i" ;then
	: 	
	else
	echo "$i"
        (( C1++ ))
	  fi
done
 

echo "Files not in medialab directory:" 

for ii in $MXML; do
	if [ -e "/root/medialab/$ii" ]; then	
	:
	else
	echo "$ii"
	(( C2++ ))
	fi
done

echo "Number of files in medialab directory that are NOT in media.xml: "$C1""
echo "Number of files in media.xml that are NOT in medialab: "$C2""
