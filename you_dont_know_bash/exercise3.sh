#/bin/env bash
# Write a function
# INPUT = string
# OUTPUT - pig latin equivalent for following cases:
# pig -> igpay
# oscon -> sconoay

function atinlay() {
  string=$1
  echo "${string:1}${string:0:1}ay"
}
