#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$(basename $0)
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
Y="\e[33m"

# Check if the script is run as root
if [ $USERID -ne 0 ]; then
    echo -e " $R error:: please run this script with root access $N"
    exit 1
fi 

# Validation function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e " $R installing $2 .. FAILURE $N"
        exit 1
    else 
        echo -e " installing $2 .. $Y success $N"
    fi
}

# Loop through the arguments
for i in "$@"; do
    rpm -q $i &>>$LOGFILE
    if [ $? -ne 0 ]; then
        echo "$i is not installed, let's install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else 
        echo -e " $Y $i is already installed $N "
    fi  
done
