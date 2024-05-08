#!/usr/bin/python3

import os
import platform

if platform.system() == 'Darwin':
    compiler = os.popen('clang --version').readlines()[0].split()[3]
    compiler = 'clang' + compiler.split('.')[0]
    os_version = 'macosx' + platform.mac_ver().pop(0).split('.').pop(0)

elif platform.system() == 'Linux':

    compiler = os.popen('gcc --version').readlines()[0].split()[2]
    compiler = 'gcc' + compiler.split('.').pop(0)

    if os.path.exists('/etc/redhat-release'):
        with open('/etc/redhat-release') as f:
            row = f.read().strip().split()
            if row[0] == 'Fedora' or row[0] == 'AlmaLinux':
                os_version = row[0].lower() + row[2].split('.').pop(0)
            elif row[0] == 'Red' and row[1] == 'Hat' and row[2] == 'Enterprise':
                os_version = 'rhel' + row[len(row)-2].split('.').pop(0)
            else:
                os_version = row[0].lower() + row[3].split('.').pop(0)

    elif os.path.exists('/etc/os-release'):
        with open('/etc/os-release') as f:
            row = f.read().strip().split()
            vers = [s for s in row if "VERSION_ID=" in s]
            os_version = 'ubuntu' + vers[0].split('="')[1].split('.')[0]
    else:
        raise ValueError('Unsupported linux version.')
else:
    raise ValueError('Unsupported platform: '+platform.system())

print('%s-%s'%(os_version,compiler))

