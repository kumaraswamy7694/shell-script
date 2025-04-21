#!/bin/bash
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"  # Red
G="\e[32m"  # Green
N="\e[0m"   # Reset
Y="\e[33m"  # Yellow
LOGDIR=/tmp

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2 $R failure $N"
        exit 1
    else
        echo  -e "$2 $G success $N"
    fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error :: please run this script"
    exit 1 # manually exit if error comes.
#else
#    echo "You are super user."
fi

yum install mysql -y &>>$LOGFILE
VALIDATE $? "this is mysql installting"
yum install postfix -y
VALIDATE $? "installing postfix"
    


