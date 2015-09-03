#!/usr/bin/env bash

FILES=$(find . -type f -name "*.phtml")

IFS=$'\n'
for filename in ${FILES[*]}
do
#  echo "$filename"
  isutf8 -q "$filename"
  if [ $? -eq 1 ]; then
    echo "$filename"
    utfFile="${filename}.utf8"
    iconv -f "ISO-8859-1" -t "UTF-8" "$filename" -o "$utfFile"
    mv "$utfFile" "$filename"
  fi
 done
