# You Don't Know Bash
* https://twitter.com/RobAboukhalil

# Basics
* Creating a shell script
  * `chmod +x app.sh` to run it
## Parse user input
  * validate
  * default values
  * [Stackoverflow](https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash)

## Functions
```bash
function hello() {
  echo "Hello $1"
  # NOT hello(arg1, arg2)
  # hello arg1 arg2
}
```

## Libraries
```bash
#!/bin bash
source library.sh # grab external script
echo abc # defined in library
```

## Strings
* String Interpolation
```bash
pet="turtle"
echo $pet
echo "I have 2 "$pet"s"
echo "I have 2 ${pet}s" # cleaner option
```

* String Manipulation
```Bash
str="Hello World"
echo ${str:1} # "ello World", like strings of arrays
echo ${str:1:5} # "ello", will return a range
echo ${str/World/OSCON} # like sed, find and replace only first find
echo ${str//l/L} # replace all lowercase l with L
```
* Exercise 3 Time!
* Multiline strings
```bash
echo "this\nstinks\nyo"
# better way...
cat << STUFF
this
is
probably
better
$var
right?
STUFF
```

## Regular Expressions
```bash
tel1="555-123-4567"
tel2="1234567-4567"
regex="^[0-9]{3}-[0-9]{3}-[0-9]{4}"
if [[ "$tel1" =~ $regex ]]; then echo "Match"; fi
if [[ "$tel2" =~ $regex ]]; then echo "Match"; fi
```
* Exercise Four

## Parsing JSON
* `brew install jq`
* `curl "https://jsonplaceholder.typicode.com/posts/1"`
* `curl "https://jsonplaceholder.typicode.com/posts/1" | jq` to format it
* `payload=$(curl -s "https://jsonplaceholder.typicode.com/posts/1")`
* `echo "$payload" | jq '.title'`
* `man jq` he moved too quickly here

## Math
* Never do floating point math
* `echo $(( val * 8 ))`
* `(( i++ ))`
* Use awk for floating point math instead

## Loops
```bash
for file in *;
do
  echo $file
done

for i in $(seq 1 10); do
  echo $i
done
```
* Exercise Five: rename IMG_123.jpg to OSCON_123.jpg

```bash
for image in *.jpg;
do
  mv $image ${image/IMG_/OSCON_};
done
```
* `-lt` less than and `-gt` greater than for comparisons of ascii values

```bash
for(( i=0; i < 10; i++ ));
do
  echo $i;
done

# check if a file exists suddenly
while true; do if [[ -f $file ]]; then break; fi; done

# strange way to iterate within a file
while read myLine;
do
  echo $myLine
done < someFile #where this is the file name goes
```
* could do this with multiple columns, but you should probably use awk at that point anyway.

```bash
abc=$(echo -e "abc\ndef\n")
while read myLine;
do
  echo $myLine
done < <(echo $abc) # process substitution
```

* Process Substitution for Gzipped Files with `zcat`
```bash
diff <(zcat file1.gz) <(zcat file2.gz)
```

## Arrays
* The basics

```bash
arr=( 1 2 3 "four" 5) # space separated
echo ${arr[1]} # specific element
echo ${arr[@]} # all elements
echo ${#arr[@]} # number of elements
echo ${!arr[@]} # all the indicies where array is defined?

# dangerous function, probably avoid
unset arr[1] # removes index 1 and doesn't shift it

arr[3]="five" # add or overwrite elements
arr+=( 6 7 ) # to append to end of array
arr[20]=20 # will actually append to index 20 and not fill in middle... odd
```
* File inputs into Arrays
```bash
somvar=($( cat somefile)) # defines an array of file contents by line
echo ${somevar[@]//i/I} # capitalize each i in the array
```
* No multi-dimensional arrays

### Looping through arrays

```bash
for element in ${array[@]};
do
  echo $element
done
```
* Exercise five

# Job Management
* long running job, like `sleep 1000` in job.sh

* If running a long script...
  * `control Z` will pause this script
  * `bg` will run the stopped script in the background, keeping you as owner
  * `fg` will bring it back in the foreground. Control C will stop it
  * run in background at start with: `./job.sh &`

* `jobs -l` command
* `disown` will disassociate the background job from my machine, allowing it to keep running, like in a tmux session
  * You cannot "re-own" the script as far as I know
  * can maybe bring it into a screen

* `pgrep` greps processes

* `screen` gives you a fresh environment.
  * `screen -li` list screens
  * `screen -S oscon` or any other name
  * `control + AD` to detach from that screen.
  * `screen -r oscon` to reattach
  * `control D or exit` to quit the screen

* `seq 1 100 | xargs -n1 -P5 ./script.sh 5`
  * xargs works like a queue to run 5 in parallel at a time? Wow.
