#!/bin/bash
#
# This script demonstrates processing the command line using functions for help and error message handling
#
# Task: Add a debug option and a verbose option to this script. Both options should set a variable if
# they appear on the command line when the script is run. The debug option is '-d' and should set
# a variable named 'debug' to the value "yes". The verbose option is '-v' and should set a variable
# named 'verbose' to "yes". The debug and verbose variables should be set to "no" if the user did not
# give the option for them on the command line when running the script. After the command line is
# processed, the script should print out 2 lines to indicate if the verbose and debug options are
# set to yes or no.

###############
# FUNCTIONS   #
###############
# Define functions for error messages and displaying command line help.
function displayusage() {
  echo "Usage: $0 [-h|--help] [-d] [-v]"
}

function errormessage() {
  echo "$@" >&2
}

###################
# CLI Processing   #
###################
# Process the command line options, saving the results in variables for later use.

# Default values
debug="no"
verbose="no"

while getopts "hdv" option; do
  case "$option" in
    h)
      displayusage
      exit 0
      ;;
    d)
      debug="yes"
      ;;
    v)
      verbose="yes"
      ;;
    *)
      errormessage "I don't know what option '-$OPTARG' is. Sorry."
      displayusage
      exit 1
      ;;
  esac
done

# Print out debug and verbose status
echo "Debug is set to: $debug"
echo "Verbose is set to: $verbose"
