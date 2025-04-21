#!/bin/bash

 DATE=$(date +%F)
 LOGSDIR=/home/centos/shellscript-logs
 SCRIPT_NAME=$0
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

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e " $R installing $2 .. FAILURE $N"
        exit 1
    else 
        echo -e " installing $2 .. $Y success $N"
    fi
}

# Loop through the arguments
for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [$? -ne 0]
    then 
        echo "$i is not insatlled, lets installeit "
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "installing $i"  
    else
        echo -e "$Y $i is already installed $N"
done

####