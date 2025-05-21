#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)     # Here, date is the linux command, we want to execute any through script, need to use $(<command-name>)
echo "Script executed at: $TIMESTAMP"

SUM=$(($NUMBER1+NUMBER2))
echo "Sum of $NUMBER1 and $NUMBER2: $SUM"