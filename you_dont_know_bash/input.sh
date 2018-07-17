 #/bin/env bash

## VALIDATION AND DEFAULT USER INPUT
usage="Please enter a name and conference"
name=${1?$usage} # validates presence of value
conference=${2:-OSCON2018} # default values

## IF STATEMENTS
# if [[ "$name" == ""]]; then
#   echo "Please enter a name"
#   exit
# fi

echo "Hello $name. Welcome to $conference." # return that variable name

# META INFO
echo $@ # output all input params
echo $# # number of parameters
echo $? # get the return code of script
