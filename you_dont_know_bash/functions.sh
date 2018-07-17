#/bin/env bash

functinon hello() {
  echo "Hello $1!"
}

# NOT hello(arg1, arg2)
# hello arg1 arg2

## VARIABLES in functions can be local
name=123;
function hello {
  local name=$1 # won't overwrite it
}

# How do you return a value from a function?
some_variable=$( hello )
