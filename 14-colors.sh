#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"

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
        echo "$2 ... $G SUCCESS $Y" | tee -a $LOG_FILE
    else 
        echo "$2... $R FAILED $B" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo " $R $package not installed , $B installing now"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$G $package installation"
    else
        echo "$G $package is installed already , skipping"
    fi
done