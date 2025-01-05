#!/bin/bash

USERID=$(id -u) #id -u = user id; USERID = variable

R="\e[31m" #red color
G="\e[32m" #green color
Y="\e[33m" #yellow color
N="\e[0m" #no color
LOG_FOLER="/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d '.' -f1)
TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
LOG_FILE_NAME=$LOG_FOLER/$LOG_FILE-$TIMESTAMP.log

VALIDATE(){
	if [ $1 -ne 0 ]
			 then
				echo  -e "$2.....$R FAIL $N"
			 else
				echo -e "$2.....$G Success $N"
			fi
}

echo "Log file is created at $TIMESTAMP" &>> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
 then
	echo "ERROR: You must have Admin access to install"
	exit 1 # it should be 0 for success and expect zero for failure
fi

dnf list installed mysql &>>$LOG_FILE_NAME #list all installed software
if [ $? -ne 0 ] # 0 means it not installed ; -ne = not equal
	then
		dnf install mysql -y &>>$LOG_FILE_NAME
		VALIDATE $? "Installing MYSQL" #function call
	else
		echo -e "MYSQL is already.....$Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME #list all installed software
if [ $? -ne 0 ] # 0 means it not installed
	then
		dnf install git -y &>>$LOG_FILE_NAME
		VALIDATE $? "Installing Git" #function call
	else
		echo -e "GIT is already.....$Y INSTALLED $N"
fi