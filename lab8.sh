#!/bin/bash

VAR=$(less /var/share/CS225/addresses.csv)
IFS=$'\n'

for LINE in $VAR; do
	FNAME=${LINE%%,*}
	#echo "FIRST NAME: $FNAME"
        
	LNAME_=${LINE#*,}         	
	LNAME=${LNAME_%%,*}
	#echo "LAST NAME: $LNAME"

	# The way I truncate each element is making two variables.
	# The first one (VAR_) is to truncate the last comma up to
	# the element I want to put into VAR. The second (VAR) 
	# truncates the first occurance of the comma.
	# At the end it looks like this: ---, [element] ,--- 
	# with --- being truncated.	
	
	WEBURL=${LINE##*,}
	#echo "WEB URL: $WEBURL"

	EMAIL_=${LINE%,*}
	EMAIL=${EMAIL_##*,}	
	#echo "EMAIL: $EMAIL"

	WPHONE_=${EMAIL_%,*}
	WPHONE=${WPHONE_##*,}
	#echo "WORK PHONE: $WPHONE"

	HPHONE_=${WPHONE_%,*}
	HPHONE=${HPHONE_##*,}
	#echo "HOME PHONE: $HPHONE"

	ZIP_=${HPHONE_%,*}
	ZIP=${ZIP_##*,}
	#echo "ZIP: $ZIP"

	STATE_=${ZIP_%,*}
	STATE=${STATE_##*,}
	#echo "STATE: $STATE"
	
	COUNTY_=${STATE_%,*}  # <-- COUNTY variable is added due to 
			      # how this csv file is formatted and 
			      # how I'm using each variables for 
			      # truncating (cascading). This 
			      # variable is not echoed at the end. 
	COUNTY=${COUNTY_##*,}
	#echo "COUNTY: $COUNTY"

	CITY_=${COUNTY_%,*}
	CITY=${CITY_##*,}
	#echo "CITY: $CITY"

	STREET_=${CITY_%,*}
	STREET=${STREET_##*,}
	#echo "STREET: $STREET"

	COMPANY_=${STREET_%,*}
	COMPANY=${COMPANY_##*,}
	#echo "COMPANY: $COMPANY"

echo "FIRST NAME: $FNAME
LAST NAME: $LNAME
COMPANY: $COMPANY
STREET: $STREET
CITY: $CITY
STATE: $STATE
ZIP: $ZIP
HOME PHONE: $HPHONE
WORK PHONE: $WPHONE
EMAIL: $EMAIL
WEB URL: $WEBURL"
echo ""

done


