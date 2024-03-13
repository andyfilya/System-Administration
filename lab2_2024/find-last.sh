#!/bin/sh

source_directory=$1
period=$2 #per seconds
save_directory="$HOME/save_directory"

# make save directory if doesn't exist
if [ ! -d $save_directory ]; then
  echo "creation $save_directory save_directory"
  mkdir $save_directory
fi 

# check is source_directory exist
if [ ! -d $source_directory ]; then
  echo "$source_directory doesn't exist."
  exit(1)
fi 

# check all files in source_directory
for file in $source_directory/*
do 
  lastmodified=$(date -r $file +%s)
  currtime=$(date +%s)
  elapsedtime=$(( currtime - lastmodified ))
  if [[ $elapsedtime -le $period ]]; then
    cp $file "$save_directory/"
  fi 
done

