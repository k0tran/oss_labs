#!/bin/bash
FILE=$HOME/bash.txt
ZEROS=/tmp/zeros
NOZEROS=/tmp/nozeros
cat "$FILE" | grep 000000 > "$ZEROS"
cat "$FILE" | grep -v  00000 > "$NOZEROS"
head "$ZEROS"
tail "$ZEROS"
head "$NOZEROS"
tail "$NOZEROS"
