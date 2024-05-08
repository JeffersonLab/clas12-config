
# system module initialization for non-login shells:
if ( -e /etc/profile.d/modules.csh ) then
    source /etc/profile.d/modules.csh
endif

# add scicomp modulefiles:
if ( -e /etc/redhat-release ) then
    if ( -e /cvmfs/oasis.opensciencegrid.org ) then
        grep -q -i -e Alma -e Plow /etc/redhat-release
        if ( $? == 0 ) then
            module use -a /cvmfs/oasis.opensciencegrid.org/jlab/scicomp/sw/el9/modulefiles
        endif
    endif
endif

# get the full path of the directory containing this file:
set ARGS=($_)
set LSOF=`env PATH=/usr/sbin:${PATH} which lsof`
set thisfile="`${LSOF} -w +p $$ | grep -oE '/.*setup.csh'  >& /dev/null`"
if ( "$thisfile" == "" ) then
   set thisfile=/does/not/exist
endif
if ( "$thisfile" != "" && -e ${thisfile} ) then
   set home="`dirname ${thisfile}`"
else if ("$1" != "") then
    # for scripted "source /path/to/this/script /path/to/this/script":
   if ( -d "$1" ) then
       set home="$1"
   else if ( -f "$1" ) then
       set home="`dirname $1`"
   endif
else if ("$ARGS" != "") then
   # for interactive, direct "source /path/to/this/script":
   set thisfile=`echo $ARGS | awk '{print$2}'`
   set home="`dirname ${thisfile}`"
else
   if ( -e setup.csh ) then
      set home=${PWD}
   else if ( "$1" != "" ) then
      if ( -e ${1}/setup.csh ) then
         set home=${1}
      else
         echo "setup.csh: ${1} does not contain a clas12 installation"
      endif
   else
      echo 'Error: The call to "source where_clas12_is/setup.csh" can not determine the location of the CLAS12 installation'
      echo "because it was embedded another script (this is an issue specific to csh)."
      echo "Use either:"
      echo "   cd where_clas12_is; source setup.csh"
      echo "or"
      echo "   source where_clas12_is/setup.csh where_clas12_is"
   endif
endif

if ($?home) then
    module use $home/modulefiles
endif

