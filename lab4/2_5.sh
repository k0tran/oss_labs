#!/bin/bash
TEMPFILE=/tmp/labfile
find "$HOME" -name "*.txt" > "$TEMPFILE" 2> /dev/null
# "выведет список таких файлов;"
cat "$TEMPFILE"
# "выведет суммарный размер в байтах и строках для файлов с расширением txt."
# для простой суммы добавить "| tail -n 1 | cut -f1" в конец (без кавычек)
# а для удобного размера -h флаг у du
du -ch `cat "$TEMPFILE"`
rm -f "$TEMPFILE"
