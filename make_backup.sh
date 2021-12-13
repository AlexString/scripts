#!/bin/bash

# Script that makes a backup of your home directory using:
# 	'restic' package

readonly DATE_DAY=`date +"%d"`
readonly DATE_MONTH=`date +"%m"`
readonly DATE_YEAR=`date +"%Y"`

readonly REPO_FOLDER="backup_folder_${DATE_DAY}_${DATE_MONTH}_${DATE_YEAR}"
readonly REPO_NAME="backup_repository${DATE_DAY}-${DATE_MONTH}-${DATE_YEAR}"

# Make a directory for a new repository

if [ ! -d "$REPO_FOLDER" ]; then
	echo "Making repository directory..."
	mkdir ./$REPO_FOLDER
fi

# Create restic repository

echo "Creating restic repository..."
restic init --repo ./$REPO_FOLDER/$REPO_NAME

# Make backup

echo "Doing backup..."
restic -r ./$REPO_FOLDER/$REPO_NAME --verbose backup --one-file-system ~/ 

echo "Backup done."

ls