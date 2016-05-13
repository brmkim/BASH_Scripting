#!/bin/bash

echo "Hello, ${USER}." 

CHECK=${USER} 
ROOT=$(echo ${CHECK} | grep -i 'root')

if [[ $USER == $ROOT ]]; then

	echo "It's insecure to run this shell script as root."
elif [[ $EUID -le 500 ]]; then
	echo "It appears that you're not an everyday user."
else
	echo "Your user ID number is: ${EUID}."
 	echo "Your home directory is: ${HOME}." 
	echo "The sizes of your home directory and its contents are:"
	echo "$(du -h /home/${USER})" 
	echo "Your home directory contains: $(ls -lh ${HOME} | gawk '{print $9}')"

fi

#bash -x 
#echo $VAR
# read balnk    <----- good for debugging
