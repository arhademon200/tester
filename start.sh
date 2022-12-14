#!/bin/bash

file=$(1.conf)
while read line; do
    for value in $line
    do
        echo -e "$line\n"
    done
done < $file




#chmod 777 main.c
