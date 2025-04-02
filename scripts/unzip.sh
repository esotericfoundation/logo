#!/bin/bash

set -e

original="$(pwd)"

cd "$(dirname "$0")"

cd ../

file=$(ls *.ggb 2>/dev/null)

if [ -z "$file" ]; then
  echo "Error: No file matching *.ggb found!"
  exit 1
fi

if ! file "$file"; then
  echo "Error: $file is not a valid zip archive!"
  exit 1
fi

mv $file ./logo

cd ./logo

unzip -o $file

mv ./$file ../

cd ../

node ./scripts/js/format.js

cd "$original"
