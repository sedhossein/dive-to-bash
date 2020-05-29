#!/bin/bash

target="/home/sedhossein/tmp/Treeboon/marketing"
backupPath="/home/sedhossein/tmp/bk/images/"
backupName="$(date +"%Y-%m-%d").zip"

if ! [[ -d "$backupPath" ]] ; then
     mkdir -p "$backupPath"
elif ! [[ -d "$target" ]] ; then
     mkdir -p "$target"
fi

zip -r $backupPath$backupName $target
