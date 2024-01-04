#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "run this script as root user"
    exit 1
else
    echo "root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Mysql installation FAILED"
    exit 1
else
    echo "Mysql installation SUCCESS"
fi
yum install git -y

if [ $? -ne 0 ] 
then
    echo "git installation failed"
    exit 1
else
    echo "git installation SUCCESS"
fi