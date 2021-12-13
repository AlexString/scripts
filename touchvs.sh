#!/bin/bash

# Create file and open file in vs code

readonly FILENAME=$1

if ! [ -z "$FILENAME" ]
then
	touch $FILENAME 
	code $FILENAME 
else
	echo "This script receives a filename, e.g: text.txt"
fi

