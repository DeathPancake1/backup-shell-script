# Backup directory script

## Description

This is a project for a script used to backup a directory to another directory every user defiened number of seconds and limited to a number of backups defined by the user

## Code overview

### backupd.sh

This is a shell script file, that takes arguments of number backups, time between backups, source directory and destination directory. The file starts by deleting old backups in backup directory if they exist. We enter an infinite loop. It then backs up the contet, then after the period the user defined checks for changes, if there are changes creates a new folder and backs up into it, until the max number of backups is reached then it deletes the oldest backup to create a new one.

### Makefile

This is a makefile that creates the backup directory if it doesn't exist and runs the backupd.sh script with the arguments provided by the user

## Prequisites

### 'make' Package

#### Description

This is the package required to run the make file on ubuntu

#### installation

To install this package you need to run the following command in your terminal
```sudo apt install make```

## Step-by-step

1. Open your terminal in the directory of the directory you want to backup
1. Make sure your backup.sh and Makefile are in the same directory
1. Set variables and run the script like this: ```src=$(your_src) dest=$(your_dest) secs=$(time_bet_backups) max=$(max_backups) make``` 
