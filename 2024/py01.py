#!/usr/bin/python
##########Import Moducle#########
import sys as sy
import shutil as sl
import os
from os import path as op

#sys=sy.argv[]
#shutil=copytree(),copy()
#os.path=isdir(),isfile()
#os=listdir()
#######Defining Variable##########
CONTROL_FLAG=sy.argv[1]
SOURCE=sy.argv[2]
DESTINATION=sy.argv[3]

print("The first command line argument is %s"%CONTROL_FLAG)
print("The second command line argument is %s"%SOURCE)
print("The thrid command line argument is %s"%DESTINATION)
########Defining Function##########
def FD_COPY():
    print("This Function has been called")
    if op.isdir(SOURCE):
       print("This is a Directory copy")
       print("copying %s into %s directory"%(SOURCE,DESTINATION))
       sl.copytree(SOURCE,DESTINATION)
       print("Directory copy complete")
       print(os.listdir(DESTINATION))
    else:
       print("This is a File copy")
       print("copying %s into %s directory"%(SOURCE,DESTINATION))
       sl.copy(SOURCE,DESTINATION)
       print("File copy complete")
       print(os.listdir(DESTINATION))

#########Main body############
if CONTROL_FLAG == "FD" or CONTROL_FLAG == "fd":
   print("This is a dirct copy script")
   FD_COPY()

print("hello world from %s"%CONTROL_FLAG)
