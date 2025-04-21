#!/bin/bash

USERID=$(id -u)


VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2 is failure"
        exit 1
    else
        echo  -e "$2 is success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "error :: please run this script"
    exit 1 # manually exit if error comes.
#else
#    echo "You are super user."
fi

yum install mysql -y 

VALIDATE $? "this is mysql installting"
yum install postfix -y
VALIDATE $? "installing postfix"
    


