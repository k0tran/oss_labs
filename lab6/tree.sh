#!/bin/bash

# This script prints tree of a target program
# First argument is prog name (without c)
# Second argument - optional flags for compiler

# Example for 2_4: ./tree.sh 2_4 "-DNUM_PROCS=100000000000" > /dev/null
# For my machin limit is between 1k and 10k

# Turn on job control
set -m

# Validate args
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
echo "Usage: $0 PROGNAME [compiler_flags]"
exit 1
fi

# Check if PROGNAME correct
if [ ! -f $1.c ]; then
echo "File \"$1.c\" not found"
exit 1
fi

# Recompile
gcc -Wall $2 $1.c -o $1

# Run
./$1 &
PID=$(ps -C $1 -o pid= | head -n 1)
pstree -cp $PID
fg

echo "Exit code: $?" > /dev/stderr