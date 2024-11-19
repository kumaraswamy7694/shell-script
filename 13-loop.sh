#!/bin/bash
for i in $a
do
    yum install $i
done
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

# improvements
# log files to this.
# implement colours
# validations
