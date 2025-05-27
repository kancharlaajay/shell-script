#!/bin/bash

USERID=$(id -u)
R="/e[31m"                        #/e[31m is the code value of RED etc....
G="/e[32m"
Y="/e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2....... $R Failure"         # $R calling the variable
        exit 1                                 # Exit will end the scirpt
    else
        echo -e "$2.......$G Success"
    fi
}

if [ $USERID -ne 0 ]  
then                                           #if ID=0 that means its root user and other than 0 its normal user
    echo -e "$R Error:: Super User access is required to run the script"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]                            # "$?"--->It will show the previouse command exit status | if exit status is 0 it means the command is success and other than 1 its failed.
then
    dnf install mysql -y
    VALIDATE $? "Installing MYSQL"
else
    echo -e "$Y MYSQL is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    VALIDATE $? "Installing NGINX"
else
    echo -e "$Y NGINX is already installed"
fi