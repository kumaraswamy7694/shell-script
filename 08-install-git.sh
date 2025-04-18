#!/bin/bash
#our prog goal is to install git.
#check root user or not
# if root user install mysql 
# root user id is 0 if not id is 1000
USERID=$(id -u)
if [$USERID -ne 0]
then
    echo "error :: please runt this script with root access"
fi
yum install git -y
git --version 