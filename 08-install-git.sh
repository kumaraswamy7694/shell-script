#!/bin/bash
#our prog goal is to install git.
#check root user or not
# if root user install mysql 
# root user id is 0 if not id is 1000
USERID=$(id -u)
if [$USERID -ne 0]
then
    echo "error :: please runt this script with root access"
    exit 1
fi

yum install mysql -y
if [ $? -eq 0 ]
then 
    echo "installation of mysql is erorr"
    exit 1
else
    echo "installation of mysql is success"
fi

git --version 
#shell script by default will not stop will have exit status 
#if $? -eq 0 previous command is success if not it is failure
# -y without human interventtion

yum install postfix -y 
if [ $? -eq 0]
then 
    echo "installation of postfix is error"
    exit 1
else 
    echo "installation of postfix is success"
fi