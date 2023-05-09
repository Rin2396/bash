#!/bin/bash

if [[ ! -f $1 ]] && [[ ! -f $2 ]]
then
    echo "Аргументы не были введены или не являются файлами"
    exit 1
fi
read -p "Введите для поиска: " search_word
counter=0
for line in $(cat inp.txt)
do
    for word in $line
    do
        if [[ $search_word == $word ]]
        then
            counter=$((counter+1))
            break
        fi
    
    done
done
echo "$counter" >> out.txt
exit 0