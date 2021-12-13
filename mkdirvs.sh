#!/bin/bash

# Create folder and open in vs code

if ! [ -z "$1" ]
then
	mkdir $1
	cd $1
	code .
else
	echo "This script receives a directory name, e.g: folder"
fi

