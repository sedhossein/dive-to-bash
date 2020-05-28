#!/bin/bash

# comment

# some global variables
echo "Detail about $0 file"
echo $1 - $2 ... $9
echo number of arguments $#
echo test this $@
echo test this $?
echo test this $$
echo test this $USER
echo test this $HOSTNAME
echo test this $SECONDS
echo test this $RANDOM
echo test this $LINENO

echo ================================

# run commands in code
cp $1 $2
echo Details for $2
ls -lh $2

echo ================================

# 
myvar=$( ls /etc | wc -l )
echo myvar

echo ================================

# variables, export
expect1=val1
expect2=val2
echo 1.  $0 ::  expect1 : $expect1, expect2 : $expect2

export expect1
./first-try-helper.sh
echo 2. $0 :: expect1 : $expect1, expect2 : $expect2


echo ================================

# i/o practice
echo Login into server:
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
echo
echo Welcome $uservar

# multiple params
echo Enter some words...
read word1 word2 word3
echo $word1 $word2 $word3


echo ================================

# stdin
cat testdata | cat /dev/stdin | cut -d' ' -f 2,3 | sort

echo ================================

# let, expr functions(+, -, \*, /, %)
let "a = 5 + 4"
echo $a
let a++
echo $a

expr 9 + 10
expr "b = 9 + 10" # does not work

echo ================================

# save command to variable
c=$(( 4 + 4 ))
echo $c
(( c++ ))
echo $c

# len
echo ${#a}
echo ${#c}
