#!/usr/bin/env  python3

import os,re

for d,subdirs,files in os.walk('./coatjava'):
  for file in files:
    if not file.endswith('.yaml'):
      continue
    m = re.match('.*(_pass[12][v12]*).*',file)
    if m is None:
      continue
    os.path.normpath(
    oldfile = file
    newfile = file.replace(m.group(1),'')
    if os.path.islink(oldfile):
      print(oldfile)
    else:
      print('NO')

