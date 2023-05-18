#!/bin/bash
while [[ -n $1 ]]
do
    case $1 in
        -i) in=$2
            shift;;
        -o) out=$2
            shift;;
    esac
    shift
done
if [[ ! -f $in || $out == "" ]] 
then
    echo "Аргументы введены неверно, перечитайте пожалуйста инструкцию"
    exit 1
fi
read -p "Введите для поиска: " search_word
counter=0
for line in $(cat $in)
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
echo $counter >> $out
exit 0