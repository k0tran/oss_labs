#!/bin/bash
TODOFILE=$HOME/TODO.txt
echo "Good morning"
echo "Current time:"
timedatectl
echo "Calendar:"
cal
cat "$TODOFILE" 2> /dev/null