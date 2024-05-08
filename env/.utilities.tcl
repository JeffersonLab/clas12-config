
# Get an environment variable, with a default if it doesn't exist.
proc getenv {name default} {
    global env
    if { [ info exists env($name) ] } {
        return $env($name)
    }
    return $default
}

# Get version number from a path-like environment variable, assuming
# the basename is a version number and with a default of "$k".
proc getvenv {path} {
    return [ exec basename [getenv $path \$$path] ] 
}

# Get the full, normlized path to the directory containing this tcl
# script, where the default depth of 2 corresponds to the relative
# location of (most) modulefiles.
proc home {{depth 2}} {
    set rpath [ string repeat "/.." $depth ]
    return [ file normalize [ file dirname [info script] ]$rpath ]
}

# Get the $OSRELEASE environment variable if it exists, else
# run our script to get what it will become upon loading modules:
proc osrelease {{depth 2}} {
    global env
    if { [ info exists env(OSRELEASE) ] } {
        return $env(OSRELEASE)
    }
    return [ exec [home $depth]/.osrelease ]
}

