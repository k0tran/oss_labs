#!/bin/bash
echo "Процессов пользователя:"
echo "$USER"
ps -e -u user --no-headers | wc -l
echo "Процессов пользователя root:"
sudo ps -e -u root --no-headers | wc -l
