#!/usr/bin/env python3

import os,re

moves = []
links = []

for d,subdirs,files in os.walk('./coatjava'):

    for file in files:

        if not file.endswith('.yaml'):
            continue

        match = re.match('.*(_pass[12v_]).*',file)

        old_file = os.path.join(d,file)
        new_file = old_file.replace(match.group(1),'')

        if os.path.islink(old_file):

            old_dest = os.path.realpath(old_file)
            old_dest = old_dest[old_dest.find('coatjava'):]
            match = re.match('.*(_pass[12v_]).*',old_dest)
            new_dest = old_dest.replace(match.group(1),'')
            links.append('git rm %s'%(old_file))
            links.append('ln -s %s %s'%(new_file, new_dest))
            links.append('git add %s'%(new_file))

        else:
            moves.append('git mv %s %s'%(old_file,new_file))

print('\n'.join(moves))
print('\n'.join(links))

