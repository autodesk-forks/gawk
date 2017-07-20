# inplace --- load and invoke the inplace extension.

@load "inplace"

# Please set inplace::suffix to make a backup copy.  For example, you may
# want to set inplace::suffix to .bak on the command line or in a BEGIN rule.

# By default, each filename on the command line will be edited inplace.
# But you can selectively disable this by adding an inplace=0 argument
# prior to files that you do not want to process this way.  You can then
# reenable it later on the commandline by putting inplace=1 before files
# that you wish to be subject to inplace editing.

# N.B. We call inplace::end() in the BEGINFILE and END rules so that any
# actions in an ENDFILE rule will be redirected as expected.

@namespace "inplace"

BEGIN {
    enable = 1         # enabled by default
}

BEGINFILE {
    if (filename != "")
        end(filename, suffix)
    if (enable)
        begin(filename = FILENAME, suffix)
    else
        filename = ""
}

END {
    if (filename != "")
        end(filename, suffix)
}
