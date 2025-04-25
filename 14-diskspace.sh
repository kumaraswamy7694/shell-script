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
DISK_USAGE_THRESHOLD=1

# Collect disk usage information
DISK_USAGE=$(df -hT | grep -vE ' tmpfs|FileSystem ')

# Initialize the message variable to collect disk usage alerts
message=""

# Iterate over each line of disk usage information
while IFS= read -r line
do 
    # Extract the usage percentage and partition name
    usage=$(echo "$line" | awk '{print $6}' | cut -d '%' -f1)
    partition=$(echo "$line" | awk '{print $1}')
    
    # Check if usage exceeds the threshold
    if [ "$usage" -gt "$DISK_USAGE_THRESHOLD" ]; then 
        # Append message for high disk usage
        message+="$Y HIGH DISK USAGE ON $partition: $usage% $N\n"
    fi
done <<< "$DISK_USAGE"

# Output the message
if [ -n "$message" ]; then
    echo -e "$message"
else
    echo "$G No partitions exceed the disk usage threshold. $N"
fi

# Optionally log to a file
echo -e "$message" >> "$LOGFILE"
echo "This is a test mail & Date $(date)" | mail -s "message" info@joindevops.com
