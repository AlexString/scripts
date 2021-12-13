#!/bin/bash

# Create folder and open in vs code

readonly FOLDERNAME=$1

if ! [ -z "$FOLDERNAME" ]
then
	mkdir FOLDERNAME$
	cd FOLDERNAME$
	code .
else
	echo "This script receives a directory name, e.g: folder"
fi

