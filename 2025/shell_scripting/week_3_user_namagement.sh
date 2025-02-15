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


# 2. delete account

function delete_user {

read -p "Enter the username you want to delete: " username

if [ $(cat /etc/passwd | grep $username | wc | awk '{print $1}') -eq 0 ];
then

        echo "user doesnot exists! "

else

        sudo userdel $username
                                                      10,1          Top
echo "======== user deleted successfully ==========="

fi

}

#delete_user


# 3. Reset password

function reset_password {

read -p "Enter the username to update password: " username

if [ $(cat /etc/passwd | grep $username | wc | awk '{print $1}') == 0 ];
then

        echo "user doesnot exists! Please enter correct username!"

else

        # reset password

        read -p "Enter password: " password

        echo -e "$password\n$password" | sudo passwd "$username" > /dev/null


        echo "password reset successfully! ";

fi

}

#reset_password

# 4. List user accounts

function list_users {

        awk -F':' '{print $1}' /etc/passwd

}


#list_users


# 5. Help and usage information


function help {

        echo -e "\n\n ======== CHOOSE AN OPTION FROM BELOW ========
                 Enter -c or --create to create a new user \n\n
                 Enter -d or --delete to delete an existing user \n\n
                 Enter -r or --reset to reset password \n\n
                 Enter -l or --list to display all the users \n\n
                 Enter -h or --help to display help and usage information \n\n"   
}

help



read option

if [[ "$option" == "-c" || "$option" == "--create" ]];
then
        create_user

elif [[ "$option" == "-d" || "$option" == "--delete" ]];
then
        delete_user

elif [[ "$option" == "-r" || "$option" == "--reset" ]];
then
        reset_password

elif [[ "$option" == "-l" || "$option" == "--list" ]];
then
        list_users

elif [[ "$option" == "-h" || "$option" == "--help" ]];
then
       help

fi


