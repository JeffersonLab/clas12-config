#!/usr/bin/env python3
import sys
previous = ''
with open(sys.argv[1],'r') as f:
    for current in f.readlines():
        if len(current.strip())==0 and len(previous.strip())==0:
            continue
        print(current.rstrip())
        previous = current
