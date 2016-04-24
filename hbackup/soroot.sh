#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0     # Only users with $UID 0 have root privileges
LINES=50       # Default number of lines saved.
E_XCD=66       # Can't change directory?
E_NOTROOT=67   # Non-root exit error.

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
   echo "Must be root to run this script."
   exit $E_NOTROOT
fi
if [ -n "$1" ]
# Test if command line argument present (non-empty).
then
   lines=$1
else
   lines=$LINES # Default, if not specified on command line.
fi
