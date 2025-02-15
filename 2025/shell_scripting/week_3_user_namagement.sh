#/bin/bash


<<info

Week 3 Challenge 1: User Account Management

 - CREATE USER ACCOUNT WITH PASSWORD
 - ACCOUNT DELETION
 - RESET PASSWORD
 - LIST USER ACCOUNTS
 - HELP AND USAGE INFORMATION

info


# 1. create account

function create_user {

echo "======== User account creation started ============="

read -p "Enter the username: " username

if [ $(cat /etc/passwd | grep $username | wc | awk '{print $1}') -eq 1 ];
then

        echo "User already exists! Try different username. "

else

        read -p "Enter the password: " password

        sudo useradd -m $username

        echo "=========== User created successfully ============="

fi

}

#create_user

