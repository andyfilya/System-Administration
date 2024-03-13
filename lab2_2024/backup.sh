#!/bin/sh

# need to check if given params == 2
if [ $# -ne 2 ]; then
  echo "error -> ./backup.sh <first_directory> <second_directory>, repeat"
  exit(1)
fi 

# scan first_directory and second_directory

first_directory=$1
second_directory=$2
log_directory="$HOME/cpy.log"

# check if second_directory exist
if [ ! -d $second_directory ]; then
  echo "creating directory $second_directory"
  mkdir -p $second_directory
fi 

# create directory for copy
num_cpy=$(ls -t $second_directory | wc -l) #num of cpy
cpy_directory="$second_directory/backup_dir_$(echo $num_cpy | tr -d ' ').tar.gz"
echo "starting create copy of $first_directory..."

tar -czf $cpy_directory $first_directory >> "$log_directory" 

# check if num of copy == 5
if [ $num_cpy -gt 5 ]; then
  rm "$second_directory/$(ls -t $second_directory | tail -1)"
fi 
echo "succesful create copy of $first_directory"
