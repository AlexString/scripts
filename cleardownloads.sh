#!/bin/bash

# cleans download folder

function askYesNo {
        QUESTION=$1
        DEFAULT=$2
        if [ "$DEFAULT" = true ]; then
                OPTIONS="[Y/n]"
                DEFAULT="y"
            else
                OPTIONS="[y/N]"
                DEFAULT="n"
        fi
        read -p "$QUESTION $OPTIONS " -n 1 -s -r INPUT
        INPUT=${INPUT:-${DEFAULT}}
        echo ${INPUT}
        if [[ "$INPUT" =~ ^[yY]$ ]]; then
            ANSWER=true
        else
            ANSWER=false
        fi
}
function deletefiles {
	rm *.* ~/Downloads/
	echo "files have been deleted."
}

askYesNo "Clean files from downloads folder?" true
DESITION=$ANSWER

if [ "$DESITION" = true ]; then
	askYesNo "This will only delete all files in Downloads folder, are you sure?" false
	CONFIRM=$ANSWER
	if [ "$CONFIRM" = true ]; then
		deletefiles
	else
		echo "canceled deleting."
	fi
else
	echo "canceled execution."
fi