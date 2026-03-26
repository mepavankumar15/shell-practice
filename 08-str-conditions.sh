#!/bin/bash

NUMBER=$1
NUMBER2=$2

if [[ $NUMBER == "Suresh" ]]; then
    echo "Given Name ${NUMBER} is Suresh"
fi

# else conditon
if [[ $NUMBER2 == "Suresh" ]]; then
    echo "Given Name is ${NUMBER2} is Suresh"
else 
    echo "it is not suresh"
fi

# else if or elif

echo "enter the value"
read STR

if [[ $STR == "Suresh" ]]; then
    echo "He is Admin"
elif [[ $STR == "Ramesh" ]]; then
    echo "He is User"
else
    echo "Not Allowed"
fi