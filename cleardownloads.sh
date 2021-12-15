#!/bin/bash

# cleans download folder

function ask_yes_no {
        local readonly QUESTION=$1
        local readonly DEFAULT=$2

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

ask_yes_no "Clean files from downloads folder?" true
DESITION=$ANSWER

if [ "$DESITION" = true ]; then
	ask_yes_no "This will only delete all files in Downloads folder, are you sure?" false
	CONFIRM=$ANSWER
	if [ "$CONFIRM" = true ]; then
		deletefiles
	else
		echo "canceled deleting."
	fi
else
	echo "canceled execution."
fi