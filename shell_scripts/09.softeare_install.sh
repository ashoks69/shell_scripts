#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You need to have root privileges to run this script"
    exit 1
fi

dnf install mysql -y
if [ $? -eq 0 ]
then
    echo "MySQL installed successfully"
else
    echo "MySQL installation failed"
fi

dnf install git -y
if [ $? -eq 0 ]
then
    echo "Git installed successfully"
else
    echo "Git installation failed"
fi