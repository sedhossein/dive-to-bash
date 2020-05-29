#!/bin/bash

dbUsername="root"
dbPassword="secret"
dbName="DBNAME"
backupPath="/home/sedhossein/tmp/bk/db/"
backupName="$(date +"%Y-%m-%d").sql"

if ! [[ -d "$backupPath" ]] ; then
     mkdir -p "$backupPath"
fi

nice -n 15 mysqldump -u$dbUsername -p$dbPassword $dbName -h mysql > $backupPath$backupName
