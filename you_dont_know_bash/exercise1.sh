#/bin/env bash
# write a standalone script
# input = file name
# if the file doesn't exist, error message and exit
# (hint: if [[ -f somefile ]]; then)
# output = the number of lines in the input file

filename=${1?Make sure you enter a file name}

## MY ANSWER
if [[ -f $filename ]]; then
  echo "Number of Lines: $(wc -l $filename)."
else
  echo "Hey, that's not a file."
fi

## His answer
# [[ ! -f "$filename" ]] && echo "Not a file" && exit
# cat "$filename" | wc -l
