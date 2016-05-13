#!/bin/bash

MLAB=$(ls /root/medialab/)

for ITEMS in $(cat /root/medialab/medialist.txt); do
	if [[ -e $(ls /root/medialab/"$ITEMS") ]]; then
        echo "Item found: "$ITEMS"" >> /root/foundfiles.txt
        else
        echo "Item Not found: "$ITEMS"" >> /root/lostfiles.txt
        fi

done
