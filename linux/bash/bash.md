# BASH Scripting
## execute scrips
`bash script.sh`
## Run script as command by adding to PATH variable
`export PATH=$PATH:/path_to_script/script.sh`
## check it's in PATH
`which script.sh`
## add execute permissions to script
`chmod +x /path_to_script/script.sh`

# Variables
## assign variable - alphanumeric or underscores
`test_var=hello`
## reference variable in script
`$test_var`
## storing command called on a variable output into variable
`$(test_cmd $var1)`

# Command line arguments
`$0` -> command
`$1` -> first argument
`$2` -> second argument etc...

# Input
`read var_name` -> it will wait for user input and store in var_name variable
`read -p "Enter your input" var_name` -> Same as above, but will print message

# Arithmetic Operations - integer
## expr
`expr 6 + 3`
`expr 6 - 3`
`expr 6 / 3`
`expr 6 \* 3` -> escape the asterisk for multiplication
### or with variables
`expr $A + $B`
`expr $A - $B`
`expr $A / $B`
`expr $A \* $B`
### double parenthesis -> no need to escape asterisk
`echo $(( A + B ))`
`echo $(( A - B ))`
`echo $(( A / B ))`
`echo $(( A * B ))`
`echo $(( ++A ))`
`echo $(( --A ))`
`echo $(( A++ ))`
`echo $(( A-- ))`

# Arithmetic Operations = float
`echo $A / $B | bc -l`

# Conditional Logic
## if
```
if [ $var1 = condition ]
then
    do something
fi
```
### else if
```
if [ $var1 = condition ]
then
    do something
elif [ $var1 = another_condition ]
then
    do something else
fi
```
### else
```
if [ $var1 = condition ]
then
    do something
elif [ $var1 = another_condition ]
then
    do something else
else
    do remaining thing
fi
```
### conditional operators
#### If string1 is exactly equal to string2 (true)
`[ "abc" = "abc" ]` 
#### If string1 is not equal to string 2 (false)
`[ "abc" != "abc" ]`
#### If number1 is equal to number2 (true)
`[ 5 -eq 5 ]`
#### If number1 is not equal to number2 (false)
`[ 5 -ne 5 ]`
#### If number1 is greater than number2 (true)
`[ 6 -gt 5 ]`
#### If number1 is less than number2 (true)
`[ 5 -lt 6 ]`
#### If abcd contains bc (true)
`[[ "abcd" = *bc*  ]]`
#### If 3rd character of abc is c or d (true)
`[[ "abc" = ab[cd] ]]`
         or
`[[ "abd" = ab[cd] ]]`
#### If 3rd character of abc is c or d (false)
`[[ "abe" = "ab[cd]" ]]`
#### If “abc” comes after “bcd” when sorted in alphabetical (lexographical) order (false)
`[[ "abc" > "bcd" ]]`
#### If “abc” comes before “bcd” when sorted in alphabetical (lexographical) order (true)
`[[ "abc" < "bcd" ]]`
#### If A is greater than 4 and less than 10
`[[ A -gt 4 && A –lt 10 ]]`
#### If A is greater than 4 or less than 10
`[[ A -gt 4 || A –lt 10 ]]`
#### if file exists
`[ -e FILE ]`
#### if file exists and is a directory
`[ -d FILE ]`
#### If file exists and has size greater than 0
`[ -s FILE]`
#### If the file is executable
`[ -x FILE]`
#### If the file is writeable
`[ -w FILE]`
#### check if command line argument is empty
`[ -n "$1" ]`

# Loops
## For loop - basic list
```
for thing in thing1 thing2 thing2
do
    execute thing
done
```
## For loop - read list from file
```
for item in $(cat data.txt)
do
    execute item
done
```
## For loop - abreviated list
```
for item in {0..100}
do
    execute item
done
```
## For loop - program style
```
for (( item = 0; item <= 100; item++))
do
    execute item
done
```
## examples
```
for file in $(ls)
do
    echo Line count of $file is $(cat $file | wc -l)
done
```
```
for package in $(cat install-packages.txt)
do
      sudo apt-get –y install $package
done
```
```
for server in $(cat servers.txt)
do
    ssh $server "uptime"
done
```

