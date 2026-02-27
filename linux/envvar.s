#!/bin/bash
echo "Enter 1 or 2, for yes or no"
read ans

RC=0

if [ $ans -eq 1 ]
then
export EVAR="yes"
elif [ $ans -eq 2 ]
then export EVAR="no"
else
export EVAR="huh?"
RC=1
fi
echo "the value of EVAR is: $EVAR"
exit $RC
