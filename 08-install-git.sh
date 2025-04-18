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
    exit  
else
    echo "installation of mysql is success"

git --version 
#shell script by default will not stop will have exit status 
#if $? -eq 0 previous command is success if not it is failure
# -y without human interventtion