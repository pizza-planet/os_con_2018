#/bin/env bash
# Write a regex to match (123) 345-3456 and (123)345-3456

tel1="(123) 345-3456"
tel2="(123)345-3456"
regex="^\([0-9]{3}\)\s[0-9]{3}-[0-9]{4}"
if [[ "$tel1" =~ $regex ]]; then echo "Match"; fi
