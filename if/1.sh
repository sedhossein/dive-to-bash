#!/bin/bash
echo ================================

# conditions
someValue=85
if [ $someValue -gt 100 ]
then
echo "Hey that's a large number.(in if)"
pwd
else
echo "Ah, that's a small number.(in else)"
fi
