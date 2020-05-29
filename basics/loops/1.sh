#!/bin/bash

counter=1
while [ $counter -le 5 ]
do
echo $counter
((counter++))
done
# =================================

counter=1
until [ $counter -gt 10 ]
do
echo $counter
((counter++))
done
# =================================

names='Stan Kyle Cartman'
for name in $names
do
echo $name
done
# =================================

for value in {1..5}
do
echo $value
done
# =================================

for value in {10..0..3}
do
echo $value
done
# =================================

val=
for value in $val/*
do
if [ ! -r $value ]
then
echo $value IS NOT readable 1>&2
continue
fi
echo $value IS readable 1>&2
done
# =================================

names='Kyle Cartman Stan Quit'
PS3='Select character: '
select name in $names
do
if [ $name == 'Quit' ]
then
break
fi
echo Hello $name
done
