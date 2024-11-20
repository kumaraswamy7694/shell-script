#!/bin/bash

DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
Y="\e[33m"
if [$USERID -ne 0]
then
    echo -e " $R error:: please run this script with root access "
    exit 1
fi 

VALIDATE (){
    if [ $1 -ne 0];
    then 
        echo -e " $R installing $2.. FAILIRE "
        exit 1
    else 
        echo -e " installing $2 .. $G success"
    fi
}

for i in $@ # it will loop from 1 to 20
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0]
    then
        echo "$? is not installed, lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$I"
    else 
        echo -e " $Y $i is already installed $N "
    fi  
done