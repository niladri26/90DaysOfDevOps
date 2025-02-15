#!/bin/bash

<<info

Week 3 Challenge 2: Automated Backup & Recovery using Cron

task01: Your task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

task02: Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.

info

# task01

src=$1
dest=$2

timestamp=$(date '+%Y-%m-%d-%H-%M')


zip -r "$dest/backup-$timestamp.zip" $src > /dev/null


echo "======= backup done ======="




