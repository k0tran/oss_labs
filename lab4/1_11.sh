#!/bin/bash
CMD="find -maxdepth 1 -type"
echo "Каталоги:"
$CMD d
echo "Обычные файлы:"
$CMD f
echo "Символьные ссылки:"
$CMD l
echo "Символьные устройства:"
$CMD c
echo "Блочные устройства:"
$CMD b
