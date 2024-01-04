#!/bin/bash

ID=$(id -u)

if ( $ID -ne 0 )
then 
    echo "run this script as root user"
    exit 1
else
    echo "root user"

yum install mysql -y

if ( $? -ne 0 )
then
    echo "Mysql installation FAILED"
    exit 1
else
    echo "Mysql installation SUCCESS"