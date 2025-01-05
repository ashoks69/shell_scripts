#!/bin/bash

USERID=$(id -u) #id -u = user id; USERID = variable
R="\e[31m" #red color
G="\e[32m" #green color
Y="\e[33m" #yellow color
N="\e[0m" #no color

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
				echo -e "Installing MYSQL.....$R FAIL $N"
			 else
				echo "Installing MYSQL.....$G Success $N"
			fi
	else
		echo "MYSQL is already.....$Y INSTALLED $N"
fi

dnf list installed git #list all installed software
if [ $? -ne 0 ] # 0 means it not installed
	then
		dnf install git -y
			if [ $? -ne 0 ]
			 then
				echo "Installing GIT.....$R FAIL $N"
			 else
				echo "Installing GIT.....$G Success $N"
			fi
	else
		echo "GIT is already.....$Y INSTALLED $N"
fi