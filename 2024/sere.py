#!/usr/bin/python

import sys as sy
import os
from os import path as op

source=sy.argv[1]


if op.isdir(source):
   print("Directory")
else:
   print("File")
