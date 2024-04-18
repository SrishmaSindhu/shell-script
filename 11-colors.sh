#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$TIMESTAMP-$SCRIPTNAME.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script starts at: $TIMESTAMP"

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
 echo  -e "$2... $R Failure $N"
 exit 1
 else
 echo  -e "$2...$G Success $N"
 fi
}

dnf install mysql -y &>>$LOGFILE 
VALIDATE $? "Installing MySQL"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing git"