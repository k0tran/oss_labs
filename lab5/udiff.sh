#!/bin/bash
# найти все процессы, у которых реальный и эффективный пользователи различаются
ps -eo euser,ruser,comm --no-headers | grep -Ev "(\S+)(\s+)\1" | grep -Eo "\S+\n"
