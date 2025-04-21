#!/bin/bash

USERID=$(id -u)


VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "installation is failure"
        exit 1
    else
        echo  -e "iinstallation is success"
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

VALIDATE $?
yum install postfix -y
VALIDATE $?
    
    

