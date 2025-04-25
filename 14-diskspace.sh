#!/bin/bash
# Colours for output formatting
#every script has three logdirectory aloso
R="\e[31m"  # Red
G="\e[32m"  # Green
N="\e[0m"   # Reset
Y="\e[33m"  # Yellow

# Log file setup
LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(basename $0)
LOGFILE="$LOGFILE_DIRECTORY/$SCRIPT_NAME-$DATE.log"

# Disk usage threshold


# Collect disk usage information
DISK_USAGE=$(df -hT | grep -vE ' tmpfs|FileSystem ')
DISK_USAGE_THRESHOLD=1
message=""
# Initialize the message variable to collect disk usage alerts


# Iterate over each line of disk usage information
while IFS= read -r line
do 
    usage=$(echo "$line" | awk '{print $6}' | cut -d % -f1) 
    partition=$(echo $line | awk '{print $1}')
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then
        message+="Disk usage on $partition : is at $usage \n"
    fi
done <<< $DISK_USAGE
echo  -e "message: $message"