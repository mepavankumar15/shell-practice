#!/bin/bash

VALIDATE(){
    if [ $1 -eq 0 ];then 
        dnf install $2 -y

    fi
}

VALIDATE $? nginx