#!/bin/bash

NUMBER=$1
NUMBER2=$2

if [ $NUMBER -gt 20 ]; then
    echo "Given Number ${NUMBER} is greater 20"
fi

# else conditon
if [ $NUMBER2 -gt 40 ]; then
    echo "Given Number is ${NUMBER2} is greater than 40"
else 
    echo "it is less than 40"
fi

# else if or elif

echo "enter the value"
read STR

if [ STR -eq Suresh ]; then
    echo "He is Admin"
elif [ STR -eq Ramesh ]; then
    echo "He is User"
else
    echo "Not Allowed"
fi