
# system module initialization for non-login shells:
if [ -e /etc/profile.d/modules.sh ]; then
    source /etc/profile.d/modules.sh
fi

# add scicomp modulefiles:
if [ -e /etc/redhat-release ]; then
    if grep -q -i Alma /etc/redhat-release || grep -q -i Plow /etc/redhat-release; then
        if [ -e /cvmfs/oasis.opensciencegrid.org ]; then
            module use /cvmfs/oasis.opensciencegrid.org/jlab/scicomp/sw/el9/modulefiles
        fi
    fi
fi

# get the full path of the directory containing this file:
src=${BASH_ARGV[0]}
if [ "x$src" = "x" ]; then
    src=${(%):-%N} # for zsh
fi
if [ "x${src}" = "x" ]; then
    [ -f ./setup.sh ] && home="$PWD" || echo ERROR: could not determine installation path!
else
    x=$(dirname ${src}) && home=$(cd ${x} > /dev/null; pwd)
fi

# add clas12 modulefiles:
module use $home/modulefiles

