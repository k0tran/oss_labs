#!/bin/bash
DIR=/usr
# 19 потому что в find указывается MiB, а в задание мегабайты (MB)
SIZE=+19M
find "$DIR" -type f -size $SIZE
