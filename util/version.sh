#!/bin/bash

# the string <!-- GEMC dev --> is replaced with the current version for all new tags
for x in $(find gemc -type f -name '*.gcard')
do
    v=$(basename $(dirname "$x"))
#    gsed -i "1 i\<!-- GEMC $v -->" $x
    gsed -i "s/<!-- GEMC.*/<!-- GEMC $v -->/" $x
done
