#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell_script/"
LOG_FILE="$LOG_FOLDER/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root(){
    if [ $USERID -ne 0 ]; then
        echo -e "$R Please run the script through $R Root user" | tee -a $LOG_FILE
        exit 1
    fi
}

mkdir -p $LOG_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$(date "+%Y-%m-%d %H:%m:%S") | $2 ....$R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$(date "+%Y-%m-%d %H:%m:%S") |$2 .....$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}