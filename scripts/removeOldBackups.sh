#!/bin/bash

isEligibleToRemove() {
    # backup details
    year=$1
    month=$2
    day=$3

    # today details
    currentYear=20$(date +"%y")
    currentMonth=$(date +"%m")
    currentDay=$(date +"%d")

    # calculate days in both dates
    backupSeconds=$(($year*364 + $month*30 + $day))
    todaySeconds=$(($currentYear*364 + $currentMonth*30 + $currentDay))

    diff=$(($todaySeconds-$backupSeconds))
    if (($diff > $savingDays)) ; then
        return 0 # 0 = true
    fi

    return 1 # 1 = false
}

removeFile() {
    filename=$1
    filepath=$2

    # split string to array to seperate day, month, year
    IFS='-'                      # `-` is set as delimiter
    read -ra tmp <<< "$filename" # str is read into an array as tokens separated by IFS

    if [ "${#tmp[@]}" -eq 3 ]; then
        
        if isEligibleToRemove "${tmp[0]}" "${tmp[1]}" "${tmp[2]}"; then
            echo "$filepath removed!"
            nice -n 15 rm -rf "$filepath"
        else
            echo "file $filename skiped."
        fi
    else
        echo "filename has invalid naming: $filepath"
    fi

    # reset to default value after usage
    IFS=' ' 
}

cleanDirectory() {
    dir=$1
    for filepath in "$dir"/* ; do
        filename=$(basename -- "$filepath")
        extension="${filename##*.}"
        filename="${filename%.*}"

        # remove just .zip files
        if [ "$extension" = "zip" ]; then
            removeFile $filename $filepath
        else
            echo "unexpected file exist:$filename:$extention"
        fi
    done
} 

# starting ...

# list of directories that could be clean in script
checkList=(/home/sedhossein/tmp/tests1 /home/sedhossein/tmp/tests2 /home/sedhossein/tmp/tests3)

# backup TTLs
savingDays=2

# let's go...
for dir in ${checkList[@]}; do
    cleanDirectory "$dir"
done
