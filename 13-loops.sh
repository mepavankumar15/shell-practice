#!/bin/bash

for i in {1..10}
do
    echo $i
done

LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "use this command in root user " | tee -a $LOG_FILE
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo "$2 ... SUCCESS" | tee -a $LOG_FILE
    else 
        echo "$2... FAILED" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed , installing now"
        dnf install $package -y $>> $LOG_FILE
        VALIDATE $? "$package installation"
    else
        echo "$package is installed already , skipping"
    fi

done