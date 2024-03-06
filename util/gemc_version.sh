#!/bin/bash

# check if the directory gemc exists, if not print message
if [ ! -d "gemc" ]; then
	echo "ERROR: Run this script at the top of the repository: util/gemc_version.sh"
	exit 1
fi

# the string <!-- GEMC * is replaced with the current version for all new tags
for x in $(find gemc -type f -name '*.gcard')
do
    v=$(basename $(dirname "$x"))
#    gsed -i "1 i\<!-- GEMC $v -->" $x
    gsed -i "s/<!-- GEMC.*/<!-- GEMC $v -->/" $x
done
