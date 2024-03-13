#!/bin/sh
mkdir $HOME/out_file

for i in {1..10}
do
  touch "main$i.txt"
done;

source file-finder.sh $HOME/MIPT/System-Administration $HOME/out_file ascii

