#!/bin/bash

source ./common.sh/

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "copying mongo.repo"

dnf install mongodb-org -y &>>$LOG_FILE
VALIDATE $? "Installing Mongodb Server"

systemctl enable mongod &>>$LOG_FILE
VALIDATE $? "Enableing mongodb"

systemctl start mongod &>>$LOG_FILE
VALIDATE $? "Starting mongodb"

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf &>>$LOG_FILE
VALIDATE $? "Chaning IP address to 0.0.0.0"

systemctl restart mongod &>>$LOG_FILE
VALIDATE $? "Restarting Mongodb"