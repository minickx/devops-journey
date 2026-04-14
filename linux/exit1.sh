#!/bin/bash
filetype=$1

if [ -z $filetype ]
then
 echo "You need to enter something"
 exit 4

fi

if [ -e $filetype ]; then

if [ -f $filetype ]; then
echo "nice, it is file "
exit 0

elif [ -d $filetype ]; then
echo "ok this is directory, bad"
exit 1
else
echo "this another type of file"
exit 2
fi

else echo "the file either doesn't exist"
exit 3

fi

