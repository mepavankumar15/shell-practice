#!/bin/bash

NUMBER=$(sudo id -u)

if [ $NUMBER -ne 0 ]; then
    echo "it is not root bitch"
    exit 1
else
    echo "running the install"
    dnf install nginx -y
    
fi