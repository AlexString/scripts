#!/bin/bash

# Create file and open file in vs code

if ! [ -z "$1" ]
then
	touch $1
	code $1
else
	echo "This script receives a filename, e.g: text.txt"
fi

