#!/bin/bash
test_file=$1

chmod +x ./$test_file

echo "Тест ввода аргументов"
./$test_file > /dev/null
test_out=`echo $?`
if [[ $test_out -eq 1 ]]
then
    echo "Тест пройден успешно"
else
    echo "Тест провален"
    exit 1
fi

echo "Тестовые аргументы для файлов"
./$test_file 'asd' 'aaa' > /dev/null
test_out=`echo $?`
if [[ $test_out -eq 1 ]]
then
    echo "Тест пройден успешно"
else
    echo "Тест провален"
    exit 1
fi

echo "Тест выполнения скрипта"
./$test_file -i inp.txt -o out.txt
test_out=`echo $?`
if [[ $test_out -eq 0 ]]
then
    echo "Тест пройден успешно"
else
    echo "Тест провален"
    exit 1
fi

# echo "Основной тест"
# ./$test_file -i inp.txt -o out.txt
# xdotool key <f>
# xdotool key <enter>

# for line in $(cat $in)
# do
#     if [[ $line -eq 3 ]]
#     then
#         echo "Тест пройден"
#         exit 0
#     else
#         echo "Тест провален"
#         exit 1
#     fi