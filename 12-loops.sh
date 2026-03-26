#!/bin/bash

for i in {1..10}
do
    echo $i
done

LOGS_FOLDER="/var/log/shell-script"
LOG_FIL="/var/log/shell-script/$0.log"

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
    dnf install $package -y
    VALIDATE $? "$package installation"
done