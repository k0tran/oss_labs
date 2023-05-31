#!/bin/bash

if [[ "$*" == *--help* ]] || [[ "$*" == *-h* ]]; then
  echo "Usage: $0"
  echo "Программа для управления файловыми системами (монтирование и отмонтирование)"
  echo "Разработчик: Сорочан Илья, студент группы Б20-505"
  exit 0
fi

function cmd_print_fs() {
  # Заголовок
  printf "%-36s %-15s %-20s\n" "Путь до устройства" "Тип ФС" "Путь до точки монтирования"

  # Тело
  df -h -x tmpfs -x devtmpfs -x squashfs -x sysfs -x proc -x debugfs --output=source,fstype,target | tail -n +2 | while read device fstype target; do
    printf "%-20s %-10s %-20s\n" "$device" "$fstype" "$target"
  done
}

function cmd_mount_fs() {
    echo -e "\n----------------------------------------------------------------------\n\nМонтирование ФС\n"
    read -p "Введите путь до устройства или файла: " device_path

    if [[ ! -e "$device_path" ]]; then
        echo "Ошибка! Файл $device_path не существует."
        return 1
    fi

    if [[ ! -f "$device_path" ]]; then
        echo "$device_path не является обычным файлом."
        return 1
    fi

    sudo mount -o loop "$device_path" /mnt || return 1

    read -p "Введите путь до точки монтирования: " mount_path

    if [[ ! -d "$mount_path" ]]; then
        echo "Каталог монтирования $mount_path создается."
        sudo mkdir -p "$mount_path" || return 1
    else

    if [[ "$(ls -A "$mount_path")" ]]; then
        echo "Каталог монтирования $mount_path не пустой."
        return 1
    fi
    
    sudo mount --bind /mnt "$mount_path" || return 1
    echo "Файловая система успешно смонтирована в $mount_path"
    return 0
}

# Команды меню
options=(
    "Вывести таблицу"
    "Монтировать"
    "Отмонтировать"
    "Изменить параметры монтирования"
    "Вывести параметры монтирования"
    "Вывести детальную информацию об ext*"
    "Выход"
)

while true; do
    # Вывод доступных команд
    echo -e "\n----------------------------------------------------------------------\n\nГлавное меню:\n"
    for i in "${!options[@]}"; do
        printf "%s. %s\n" "$((i+1))" "${options[$i]}"
    done
    echo ""

    read -rp "> " option

    # Обработка команд
    case $option in
        1)
            echo -e "\n----------------------------------------------------------------------\n\n"
            cmd_print_fs
            echo ""
            ;;
        2)
            cmd_mount_fs
            ;;
        3)
            echo "Отмонтируем"
            exit 0
            ;;
        7)
            echo "...выход из программы..."
            exit 0
            ;;
        *)
            echo "Ошибка! Неверная команда, попробуйте снова."
            ;;
    esac
done
