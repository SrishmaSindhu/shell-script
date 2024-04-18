#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

VALIDATE(){
 if [ $1 -ne 0 ]
 then 
 echo "$2...Failure"
 exit 1
 else
 echo "$2...Success"
 fi
}

dnf install mysqll -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing git"