#!/bin/bash
# colours
# validation
# log
LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE ' tmpfs|FileSystem ')
DISK_USAGE_THERESHOLD=1

# ifs= means internal field seperation
while IFS= read line
do 
    usage=$ (echo $line | awk '{print $6}' | cut -d % -f1 )
    partition=$(echo $line | awk '{print $1}')
    #now you need to check the threashold
    if [$usage -gt $DISK_USAGE_THERESHOLD];
    then 
        message+=" HIGH DISK USAGE ON $partition: $usage
    fi
done <<< $DISK_USAGE

echo "message: $message"

