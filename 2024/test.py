#!/usr/bin/python

import sys as sy
import shutil as sl
import time as t

source=sy.argv[1]
destination=sy.argv[2]
time_string=t.localtime()
TS=t.strftime("%d%m%y%H%M%S",time_string)
scr=source + "_" + str(TS)

print(scr)
sl.copytree(source,scr)
sl.copytree(scr,destination)

