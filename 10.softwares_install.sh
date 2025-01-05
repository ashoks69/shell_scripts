#!/bin/bash

USERID=$(id -u) #id -u = user id; USERID = variable

if [ $USERID -ne 0 ]
 then
	echo "ERROR: You must have Admin access to install"
	exit 1 # it should be 0 for success and expect zero for failure
fi

dnf list installed mysql #list all installed software
if [ $? -ne 0 ] # 0 means it not installed ; -ne = not equal
	then
		dnf install mysql -y
			if [ $? -ne 0 ]
			 then
				echo "Installing MYSQL.....FAIL"
			 else
				echo "Installing MYSQL.....Success"
			fi
	else
		echo "MYSQL is already.....INSTALLED"
fi

dnf list installed git #list all installed software
if [ $? -ne 0 ] # 0 means it not installed
	then
		dnf install git -y
			if [ $? -ne 0 ]
			 then
				echo "Installing GIT.....FAIL"
			 else
				echo "Installing GIT.....Success"
			fi
	else
		echo "GIT is already.....INSTALLED"
fi