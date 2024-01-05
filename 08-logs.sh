#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/temp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>>LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 $R FAILED $N"
        exit1
    else 
        echo "$2 $G SUCCESS $N"
    fi
}
if [ $ID -ne 0 ]
then
    echo "run this script as root user"
    exit 1
else
    echo "root user"
fi

yum install mysql -y &>>LOGFILE

VALIDATE $? "MYSQL INSTALLATION" &>>LOGFILE

yum install git -y &>>LOGFILE

VALIDATE $? "GIT INSTALLATION" &>>LOGFILE