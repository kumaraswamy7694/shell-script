#!/bin/bash
USERID=$(id -u)
R="\e[31m"
N="\e[0m"
if [$USERID -ne 0];
then
    echo "erro: $R please run this script with root access $N"
    exit 1
fi 

for i in $@ # it will loop from 1 to 20
do
    yum install $i -y
done