#!/bin/bash
echo "Домашний каталог пользователя:"
echo "$HOME"
echo "содержит обычных файлов:"
find "$HOME" -maxdepth 1 -type f -name ".*" -o -print | wc -l
echo "скрытых файлов:"
find "$HOME" -maxdepth 1 -type f -name ".*" | wc -l
