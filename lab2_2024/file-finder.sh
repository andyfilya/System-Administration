#!bin/sh

directory="$1"
format="$2"

if [ ! -d "$directory" ]; then
  echo "$directory - is not a directory..."
  exit(1)
fi

for f in "$directory"/*; do
  if [[ $(echo "$f" | tr '[:upper:]' '[:lower:]') == *.$format ]]; then
    echo $f
  fi
done;
