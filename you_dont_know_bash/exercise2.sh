#/bin/env bash

# Write a function
# INPUT: input interger
# OUTPUT: integer times two and echo it

function math_time() {
  local number=$1
  echo $(( $number * 2 ))
}
