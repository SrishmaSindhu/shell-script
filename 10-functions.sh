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
 echo "exit status: $1"
 echo "what are you doing:$2"
}

dnf install mysql -y
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing git"