#!/bin/bash

<<info

Week 3 Challenge 2: Automated Backup & Recovery using Cron

task01: Your task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

task02: Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.

info


# task 01

function display_usage {

        echo "usage: ./automated_backup.sh <source path> <destination path>"

}


if [ $# -eq 0 ]; then

        display_usage

fi



src=$1
dest=$2
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')

function create_backup {

        zip -r "${dest}/backup_${timestamp}.zip" "${src}" > /dev/null

        if [ $? -eq 0 ]; then

                echo "backup generated successfully for ${timestamp}"

        fi

}


# task 02

function perform_rotation {

        backups=($(ls -t "${dest}/backup_"*.zip 2> /dev/null))
        #echo "${backups[@]}"


        if [ "${#backups[@]}" -gt 3 ]; then
                echo "Performing latest three backups."

                backups_to_remove=("${backups[@]:3}")

                #echo "${backups_to_remove[@]}"


                for backup in "${backups_to_remove[@]}";
                do

                        rm -f ${backup}

                done
        fi

}


create_backup

perform_rotation








