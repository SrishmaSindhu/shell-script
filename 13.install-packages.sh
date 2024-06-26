#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPTNAME=$( echo $0 | cut -d "." -f1 )
LOGFILE=$TIMESTAMP-$SCRIPTNAME.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then 
    echo "need root access"
    exit 1
else     
    echo  "super user"
fi

VALIDATE() {
    if [$1 -nq 0]
     then 
        echo -e "$2 ..$R FAILED $N"
     else 
           
       echo -e " $2... $G SUCCESS $N"
  fi  
}

for i in $@
do 
  echo "package to install: $i"
  dnf list installed $i &>>$LOGFILE
  if [ $? -eq 0 ]
  then 
     echo -e  "$i already installed.. $Y SKIPPING $N"
  else
     dnf install $i -y &>>$LOGFILE
     VALIDATE $? "Installation of $i"
   fi
done  






