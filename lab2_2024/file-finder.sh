#!/bin/sh

in="$1"
out="$2"
format="$3"

if [ ! -d "$in" ]; then
  echo "$in - is not a directory..."
  exit 1
fi

if [ ! -d "$out" ]; then
  echo "$out - is not a directory..."
  mkdir "$out"
fi

for f in "$in"/*; do
  file_type=$(file -b "$f")
  if [ "$file_type" == "$format" ]; then 
    mv "$f" "$out"
  fi
done;
