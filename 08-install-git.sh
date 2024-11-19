#!/bin/bash
USERID=$(id -u)
if [$USERID -ne 0]
then
    echo "ERRO : please run this script with root access "
fi

yum install mysql -y 
yum install postfix -y
if [$? -ne 0]
then 
    echo "installation of postfix is error"
    exit 1
else 
    echo "installation of postfix is success"
fi