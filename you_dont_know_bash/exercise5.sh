#/bin/env bash
# EXERCISE query https://jsonplaceholder.typicode.com/comments?postId=<VAL>
# fetch first 10 posts: ?postId=1
# for each post comment, extract email key from JSON and append it to an array

emailArray=()
api="https://jsonplaceholder.typicode.com/comments" # each post has 5 comments
for i in $(seq 1 10);
do
  emailArray+=($( curl -s ${api}?postId=${i} | jq -r -c '.[].email'))
done

# second loop to get this back out from the array
for email in ${emailArray[@]};
do
  echo $email
done
