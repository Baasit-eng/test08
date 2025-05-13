#!/bin/bash


#####Creating Variable############################################
BK=$1
BK_LOC=$2
RUNNER=$3
BK_TYPE=$4
##########Timestamp######################
TS=$(date +%d%m%y.%H:%M:%S)

################Check usage#########################
if [$# -ne 4]
then
    echo "You are doimg something wrong!
    Usage: Input 4 Command Line Arg
    For example; ./bash.sh Filename Destination Runner Typeoffile"
fi
 echo "The Command line Arg are:
${BK}
${BK_LOC}
${RUNNER}
${BK_TYPE}"

####################Main Body####################################
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

DIR_CHECK=${BK_LOC}/${RUNNER}/${BK_TYPE}/${TS}

if [[ -d $DIR_CHECK ]]
then
    echo "The Directory Exists!"
else 
    echo "The Directory does not exist"
    exit
fi

