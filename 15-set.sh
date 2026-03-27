#!/bin/bash

set -e # it is a error identifier which exits the execution at the occurence of error

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

echo -e "$R Hello world , Bitches"


LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo -e " $R use this command in root user " | tee -a $LOG_FILE
    exit 1
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo "$2 ... $G SUCCESS $N" | tee -a $LOG_FILE
    else 
        echo "$2... $R FAILED $N" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo -e " $R $package not installed $N , $B installing now"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? " $package installation"
    else
        echo -e "$G $package is installed already $N , $B skipping"
    fi
done