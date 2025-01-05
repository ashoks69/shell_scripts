#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
 then
	echo "ERROR: You must have Admin access to install"
	exit 1
fi

if [ $? -ne 0 ] # 0 means it not installed
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