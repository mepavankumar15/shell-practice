#!/bin/bash

NUMBER=$(sudo id -u)

if [ $NUMBER -eq 0 ]; then
    dnf install nginx -y
else
    echo "it is not root bitch"