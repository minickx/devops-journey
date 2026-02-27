#!/bin/bash
function1() {
echo "this is 1"
}
function2() {
echo "this is 2"
}
function3() {
echo "this is 3"
}

read -p "chose a number, mate, 1 to 3: " ans

if [ $ans -eq 1 ]; then
function1
elif [ $ans -eq 2 ]; then
function2
elif [ $ans -eq 3 ]; then
function3
else
echo "1 to 3, mate, invalid"
fi
