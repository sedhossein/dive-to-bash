#!/bin/bash

dbUsername="root"
dbPassword="secret"
dbName="DBNAME"
backupPath="/home/sedhossein/tmp/bk/db/"
backupName="$(date +"%Y-%m-%d").sql"

if ! [[ -d "$backupPath" ]] ; then
     mkdir -p "$backupPath"
fi

sudo -u YOUR_USER nice -n 15 mysqldump -u$dbUsername -p$dbPassword $dbName -h mysql > $backupPath$backupName

# upload to cloud storage
sudo -u YOUR_USER nice -n 15 mega-put $backupPath$backupName /bk/db
