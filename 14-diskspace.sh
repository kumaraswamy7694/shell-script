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
    echo "output :$line"
done <<< $DISK_USAGE


