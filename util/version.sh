#!/bin/bash
for x in $(find gemc -type f -name '*.gcard')
do
    v=$(basename $(dirname $x))
    gsed -i "1 i\<!-- GEMC $v -->" $x  
done
