#!/bin/bash
VAR1=$1
VAR2=$2
echo "script name : $0"
# $0 is the name of the script
echo "variable 1 : $VAR1"
echo "all vars : $@"
echo " no of vars : $#"
# how many varialbes passed