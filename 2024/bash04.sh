#!/bin/bash

FD_BACKUP()
{
  echo "Welcome to File or Directory Backup"
  ##########Timestamp######################
  TS=$(date +%d%m%y.%H:%M:%S)
  ########################################################
  if [[ "$BK_TYPE" == F || "$BK_TYPE" == f ]]
  then
      echo "It is a File copy"
      BK_TYPE=FILE
  elif [[ "$BK_TYPE" == D || "$BK_TYPE" == d ]]
  then
      echo "It is a Directory copy"
      BK_TYPE=DIRECTORY
  else
      echo "Not recognized!
            F for File copy
            D for Directory copy"
      exit
  fi


  echo "The Command line Arg passed are:
  ${BK}
  ${BK_LOC}
  ${RUNNER}
  ${BK_TYPE}"

  ###################Creating a Backup file#################################
  echo "Creating ${BK} file"
  touch "${BK}"
  if (($? == 0))
  then
      echo "File created successfully!"
  else
      echo "File creation failed!"
      exit
  fi
  ###########Creating Backup Location################
  echo "Creating ${BK_LOC}/${RUNNER}/${BK_TYPE} Directory"
  mkdir -p "${BK_LOC}/${RUNNER}/${BK_TYPE}/${TS}"
  if (($? == 0))
  then
      echo "Directory created successfully!"
  else
      echo "Directory creation failed!"
      exit
  fi
  ##############Copying Backup file into the Backup Location######################
  echo "Copying ${BK} into ${BK_LOC}/${RUNNER}/${BK_TYPE} Directory"
  cp "${BK}" "${BK_LOC}/${RUNNER}/${BK_TYPE}/${TS}"
  if (($? == 0))
  then
      echo "Copied file successfully!"
  else
      echo "Copied file failed!"
      exit
  fi
}

FD_DIRECTORY_CHECK()
{
  echo "Welcome Directory Check"
  #DIR_CHECK=${BK_LOC}/${RUNNER}/${BK_TYPE}/${TS}#
  echo "The Command Line Argument passed is:
  $DIR_CHECK"
  if [[ -d $DIR_CHECK ]]
  then
      echo "The Directory Exists!"
  else 
      echo "The Directory does not exist"
      exit
  fi
}

FD_DELETE()
{
  ########Deletion####################
  echo "Welcome to File or Directory deletion"
  cd $WHITE
  export choose=$(ls | nl -s ')' | grep "$BLACK" | cut -f 2 -d ')')
  echo "You've selected $choose"
  if [[ $choose == $BLACK ]]
  then
      echo "Deleting..."
      rm -r $choose
      if (($? == 0))
      then
          echo "Deletion completed"
      else
          echo "Deletion Failed"
          exit
      fi
  fi
}
############################################################################################3
CONTROL_FLAG=$1
if [[ $CONTROL_FLAG == "scheduled" || $CONTROL_FLAG == "SCHEDULED" ]]
then
    DECISION=$2
    if [[ $DECISION == 1 ]]
    then
        if (($# != 6))
        then
            echo "You doing something wrong!
            USAGE: You need 6 Command line Arguments to run this script
            The first comm line arg should be 'scheduled' or 'not_scheduled'
            The second comm line arg should be '1' for Backup
            The thrid comm line arg should be your backup file e.g pra.sh
            The fourth comm line arg should be the path of the backup destination e.g devops/2024
            The fifth comm line arg should be the Runner's name e.g Baasit
            The sixth comm line arg should be the type of the back up e.g f for file, d for directory
            for example: ./bash04.sh [comm 1] [comm 2] [comm 3] [comm 4] [comm 5] [comm 6]"
            exit
        fi
        BK=$3
        BK_LOC=$4
        RUNNER=$5
        BK_TYPE=$6
    elif [[ $DECISION == 2 ]]
    then
        if (($# != 3))
        then
            echo "You doing something wrong!
            USAGE: You need 3 Command line Arguments to run this script
            The first comm line arg should be 'scheduled' or 'not_scheduled'
            The second comm line arg should be '2' for Directory Check
            The thrid comm line arg should be the path of the directory you want to check e.g devops/2024
            for example: ./bash04.sh [comm 1] [comm 2] [comm 3]"
            exit
        fi
        DIR_CHECK=$3
    elif [[ $DECISION == 3 ]]
    then
        if (($# != 4))
        then
            echo "You doing something wrong!
            USAGE: You need 4 Command line Arguments to run this script
            The first comm line arg should be 'scheduled' or 'not_scheduled'
            The second comm line arg should be '3' for File Deletion
            The thrid comm line arg should be the path of the directory you want to delete in e.g devops/2024
            The fourth comm line arg should be the name of the file you want to delete e.g pra.sh
            for example: ./bash04.sh [comm 1] [comm 2] [comm 3] [comm 4]"
            exit
        fi
        WHITE=$3
        BLACK=$4
    else
        echo "Invalid Entry"
        exit
    fi
elif [[ $CONTROL_FLAG == "not_scheduled" || $CONTROL_FLAG == "NOT_SCHEDULED" ]]
then
    echo "This Job is not scheduled"
    read -p "What do you want to do?
    Enter 1 for File or Directory Backup
    Enter 2 for Directory Check
    Enter 3 for File or Directory Deletion
    Entry: " DECISION
    echo "You've selected $DECISION"
    if [[ $DECISION == 1 ]]
    then
        read -p "Enter the path of the File or Directory you want to backup?
        Entry: " BK
        read -p "Enter the path of the Destination you want to transfer the backup to
        Entry: " BK_LOC
        read -p "Enter the name of the Runner
        Entry: " RUNNER
        read -p "Enter the Backup Type
        Entry: " BK_TYPE
        echo "Your request is being processed"
    elif [[ $DECISION == 2 ]]
    then
        read -p "Enter the path of the Directory you want check
        Entry : " DIR_CHECK
        echo "Your request is being processed"
    elif [[ $DECISION == 3 ]]
    then
        read -p "Enter the Directory you want to delete in
        Entry: " WHITE
        ls | nl -s '.'
        read -p "Enter the name of the File you want to delete
        Entry: " BLACK
        echo "Your request is being processed"
    else
        echo "invalid option"
        exit
    fi
else
    echo "You are doing something wrong!
    USAGE: You need atleast 1 Command Line Argument to run this script; scheduled or not_secheduled
    For example: ./bash04.sh [comm 1]"
    exit
fi

case $DECISION in
    1) echo "You've selected the first option"
       FD_BACKUP $BK $BK_LOC $RUNNER $BK_TYPE
       echo "Your request is being processed";; 
    2) echo "You've selected the second option"
       FD_DIRECTORY_CHECK $DIR_CHECK
       echo "Your request is being processed";;
    3) echo "You've selected the thrid option"
       FD_DELETE $WHITE $BLACK
       echo "Your request is being processed";;
    *) echo "Invalid option";;
esac

