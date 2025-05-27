#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.......Failure"
        exit 1                                 # Exit will end the scirpt
    else
        echo "$2.......Success"
    fi
}

if [ $USERID -ne 0 ]  
then                                           #if ID=0 that means its root user and other than 0 its normal user
    echo "Error:: Super User access is required to run the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]                            # "$?"--->It will show the previouse command exit status | if exit status is 0 it means the command is success and other than 1 its failed.
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo "MYSQL is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    VALIDATE $? "Installing NGINX"
else
    echo "NGINX is already installed"
fi