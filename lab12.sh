#!/bin/bash

DATA=$(less /var/share/CS225/addresses.csv)
IFS=$'\n'

i=0
for LINE in $DATA; do
        FNAME[$i]=${LINE%%,*}
        
	LNAME_=${LINE#*,}               
        LNAME[$i]=${LNAME_%%,*}
        
        WEBURL[$i]=${LINE##*,}

        EMAIL_=${LINE%,*}
        EMAIL[$i]=${EMAIL_##*,}     

        WPHONE_=${EMAIL_%,*}
        WPHONE[$i]=${WPHONE_##*,}

        HPHONE_=${WPHONE_%,*}
        HPHONE[$i]=${HPHONE_##*,}

	ZIP_=${HPHONE_%,*}
        ZIP[$i]=${ZIP_##*,}

        STATE_=${ZIP_%,*}
        STATE[$i]=${STATE_##*,}
        
        COUNTY_=${STATE_%,*}   
        COUNTY[$i]=${COUNTY_##*,}

        CITY_=${COUNTY_%,*}
        CITY[$i]=${CITY_##*,}

        STREET_=${CITY_%,*}
        STREET[$i]=${STREET_##*,}

        COMPANY_=${STREET_%,*}
        COMPANY[$i]=${COMPANY_##*,}

        (( i++ ))


done 

for THINGS in $DATA;do 
	echo "$THINGS"
done 

cleanUp(){
	echo "control-c entered. Exiting the script."
	rm -f $TEMPVAR 2> /dev/null
	exit 1
}

trap cleanUp SIGINT



