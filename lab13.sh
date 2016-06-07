#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: $0 <argument>"
exit 1
fi



#
# Functions
#

# 0) Trap

CLEAN_UP(){

echo "control-c entered. Exiting the script."
rm -r $TEMPVAR 2> /dev/null
exit 1

}

# 1) Check IP Address

CHECK_IP(){

if [[ "$1" =~ ^([0-2][0-5][0-5](| |-|\.)){3}[0-2][0-5][0-5]$ ]]; then
	echo "You've entered an IP address ($1)"
elif [[ "$1" =~ ^([0-9]?[0-9](| |-|\.)){3}[0-9]?[0-9]$ ]]; then
	echo "You've entered an IP address ($1)"
else
	return 1
fi

}

# 2) Check Social Security Number 

CHECK_SSN(){

if [[ "$1" =~ ^[0-9]{3}(| |-|\.)[0-9]{3}(| |-|\.)[0-9]{4}$ ]]; then
	echo "You've entered an social security number ($1)"
	echo "(Note: for a phone number, please add the one-digit country code)"
else
	return 1
fi

}

# 3) Check Phone Number

CHECK_PN(){

if [[ "$1" =~ ^\+?[0-9](| |-|\.)\(?[2-9][0-9]{2}\)?(| |-|\.)[0-9]{3}(| |-|\.)[0-9]{4}$ ]]; then
	echo "You've entered a phone number ($1)"
else	
	return 1
fi

}
	
# 4) Check Credit Card Number

CHECK_CCN(){

if [[ "$1" =~ ^([0-9]{4}(| |-|\.)){3}[0-9]{4}$ ]]; then
	echo "You've entered a credit card number"
elif [[ "$ARG" =~ ^[0-9]{4}(| |-|\.)[0-9]{6}(| |-|\.)[0-9]{5}$ ]]; then
	echo "You've entered an American Express credit card number"
else
	return 1
fi
}

if ( CHECK_IP $@ ); then
	exit 0
elif ( CHECK_SSN $@ ); then 
	exit 0
elif ( CHECK_PN $@ ); then
	exit 0
elif ( CHECK_CCN $@ ); then
	exit 0
else
	echo "Please enter a valid set of numbers"
	exit 1
fi

trap CLEAN_UP SIGINT



