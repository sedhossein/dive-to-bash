#!/bin/bash

# conditions
someInteger=85
if [ $someInteger -gt 100 ]
then
echo "Hey that's a large number.(in if)"
pwd
else
echo "Ah, that's a small number.(in else)"
fi
# =================================
someString=""
if [ -z "$someString"  ]
then
echo "Empty string"
else
echo "Not Empty string"
fi
# =================================
someString="some string"
if [ ! -n "$someString" ]
then
echo "Empty string"
else
echo "Not Empty string"
fi
# =================================
someString="some string"
test -z "$someString"  && echo "Empty" || echo "Not empty"
# =================================
ls /tmp > myfile
test -s myfile
echo $?
# =================================
someInteger=9990
if test $someInteger -ge 1000 && [ ${#someInteger} -ge 5 ] # I know it's silly condition :)
then
    echo Hey that\'s too large number.
elif [ $someInteger -ge 100 ]
then
    echo Hey that\'s a large number.
    if (( $someInteger % 2 == 0 ))
    then
        echo And is also an even number.
    fi
fi
# =================================
yournumber="+1232456"
re='^[+-]?[0-9]+([.][0-9]+)?$'
if ! [[ $yournumber =~ $re ]] ; then
   echo "error: Not a number" >&2; exit 1
else
    echo "number is verfied"
fi
# =================================

space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )
case $space_free in
[1-5]*)
echo Plenty of disk space available
;;
[6-7]*)
echo There could be a problem in the near future
;;
8*)
echo Maybe we should look at clearing out old files
;;
9*)
echo We could have a serious problem on our hands soon
;;
*)
echo Something is not quite right here
;;
esac


# Operator	‍                Description
# =============================================================================================
# ! EXPRESSION	            The EXPRESSION is false.
# -n STRING	                The length of STRING is greater than zero.
# -z STRING	                The lengh of STRING is zero (ie it is empty).
# STRING1 = STRING2	        STRING1 is equal to STRING2
# STRING1 != STRING2	    STRING1 is not equal to STRING2
# INTEGER1 -eq INTEGER2 	INTEGER1 is numerically equal to INTEGER2
# INTEGER1 -gt INTEGER2	    INTEGER1 is numerically greater than INTEGER2
# INTEGER1 -lt INTEGER2 	INTEGER1 is numerically less than INTEGER2
# -d FILE	                FILE exists and is a directory.
# -e FILE	                FILE exists.
# -r FILE	                FILE exists and the read permission is granted.
# -s FILE	                FILE exists and it's size is greater than zero (ie. it is not empty).
# -w FILE	                FILE exists and the execute permission is granted.