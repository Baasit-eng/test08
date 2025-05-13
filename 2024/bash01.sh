#!/bin/bash

#####Creating Variable############################################
FILE=$1
DESTINATION=$2
RUNNER=$3
##########Timestamp######################
TS=$(date +%d%m%y_%H:%M:%S)
echo "${TS}"
################Check usage#########################
'''if (($# != 3))
then
    echo "You are doimg something wrong!
    Usage: Input 3 Command Line Arg
    For example; ./bash.sh Filename Destination Runner"
    exit
fi

 echo "The Command line Arg are:
${FILE}
${DESTINATION}
${RUNNER}"

###################Creating a file#################################
echo "Creating ${FILE} file"
touch "${FILE}"
if (($? == 0))
then
    echo "File created successfully!"
else
    echo "File creation failed!"
    exit
fi

###########Creating Destination Directory################
echo "Creating ${DESTINATION}/${RUNNER} Directory"
mkdir -p "${DESTINATION}/${RUNNER}_${TS}"
if (($? == 0))
then
    echo "Directory created successfully!"
else
    echo "Directory creation failed!"
    exit
fi

##############Copying File into the Destination Directory######################
echo "Copying ${FILE} into ${DESTINATION}/${RUNNER} Directory"
cp "${FILE}" "${DESTINATION}/${RUNNER}_${TS}"
if (($? == 0))
then
    echo "Copied file successfully!"
else
    echo "Copied file failed!"
    exit
fi'''
