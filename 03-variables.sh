#!/bin/bash

#declaring of varible
PERSON1=$1
PERSON2=$2
DATE=$(date)
CAL=$(cal)

#referring variable
echo "$PERSON1:: Hello $PERSON2, How are you?"
echo "${PERSON2}:: Hi $PERSON1, I am fine. How are you?"
echo "$PERSON1:: I am fine too. how is your work?"
echo "$PERSON2:: not bad. I am thinking to upgrade to DevOps"
echo "date is $DATE"
echo "cal is $CAL"
ls -l
cat README.MD