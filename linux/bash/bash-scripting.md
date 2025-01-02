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
`echo $(( $A + $B ))`
`echo $(( $A - $B ))`
`echo $(( $A / $B ))`
`echo $(( $A * $B ))`
`echo $(( ++$A ))`
`echo $(( --$A ))`
`echo $(( $A++ ))`
`echo $(( $A-- ))`

# Arithmetic Operations = float
`echo $A / $B | bc -l`

# Conditional Logic
## if
```
if [ $var1 = condition ]
then
    execute something
fi
```
### else if
```
if [ $var1 = condition ]
then
    execute something
elif [ $var1 = another_condition ]
then
    execute something else
fi
```
### else
```
if [ $var1 = condition ]
then
    execute something
elif [ $var1 = another_condition ]
then
    execute something else
else
    execute remaining thing
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
```
for file in $(ls images)
do
        if [[ $file = *.jpeg ]]
                then
                new_name=$(echo $file| sed 's/jpeg/jpg/g')
                mv images/$file images/$new_name
        fi
done
```

# While loops

* Execute a command or a set of commands multiple times but you are not sure how many times.
* Executeacommandorasetofcommandsuntilaspecificconditionoccurs
* Createinfiniteloops
* Menudrivenprograms
 

## example syntax
```
while [ $rocket_status = "launching"  ]
do
    sleep 2
    rocket_status=rocket-status $mission_name
if [$rocket_status = "launching"]
done
```

```
while [ $rocket_status = "launching" ] 
do
    sleep 2
    rocket_status=rocket-status $mission_name
done
if [$rocket_status="failed" ] 
then
       rocket-debug $mission_name
fi
```

```
while true 
do
    echo "1. Shutdown"
    echo "2. Restart"
    echo "3. Exit Menu"
    read –p "Enter your choice: " choice
    if [ $choice  -eq 1 ]
    then
        shutdown now
    elif [ $choice  -eq 2 ]
    then
        shutdown –r now
    elif [ $choice  -eq 3 ]
    then
        break
    else
        continue
    fi
done
```

```
while true
do
  echo "1. Add"
  echo "2. Subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  read -p "Enter your choice: " choice

  if [ $choice -eq 1 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 + $number2 ))
  elif [ $choice -eq 2 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 ))
  elif [ $choice -eq 3 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 ))
  elif [ $choice -eq 4 ]
  then
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
  elif [ $choice -eq 5 ]
  then
    break
  fi
```

# Case statement
## example syntax
```
echo "1. Shutdown"
echo "2. Restart"
echo "3. Exit Menu"
read –p "Enter your choice: " choice
case $choice in
        1) shutdown now
            ;;
        2) shutdown –r now
            ;;
        3) break ;;
        *) continue
            ;;
esac
```

```
while true
do
  echo "1. Add"
  echo "2. Subtract"
  echo "3. Multiply"
  echo "4. Divide"
  echo "5. Quit"

  read -p "Enter your choice: " choice

  case $choice in
    1)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 + $number2 ))
        ;;
    2)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 - $number2 ))
        ;;

    3)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 * $number2 ))
        ;;
    4)
        read -p "Enter Number1: " number1
        read -p "Enter Number2: " number2
        echo Answer=$(( $number1 / $number2 ))
        ;;
    5)
        break
        ;;
  esac
```

# Shebang
## specify what shell a script must run in. Place at top of script
`#!/bin/bash`
# exit codes
## success
`0`
## failure
`>0`
## see exit code of command
`echo $?`

# Functions
## when to use
* Break up large script that performs many different tasks: • Installing packages
* Adding users
* Configuring firewalls
* Perform Mathematical calculations

## example syntax
```
function add(){
    echo $(( $1 + $2 ))
}

add 3 5
```

```
function add(){
    echo $(( $1 + $2 ))
}

sum=$( add 3 5 )
```

```
function add(){
    return $(( $1 + $2 ))
}
add 3 5 
sum=$?
```

# Shell Checkers
`apt install shellcheck`
`yum install shellcheck`

sudo sed -i 's#// \(\$link = mysqli_connect(.*172\.20\.1\.101.*\)#\1#; s#^\(\s*\)\(\$link = mysqli_connect(\$dbHost, \$dbUser, \$dbPassword, \$dbName);\)#\1// \2#' /var/www/html/index.php

