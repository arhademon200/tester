#!/bin/bash
#mkdir make
#cd make
chmod 777 CMakeLists.txt
cmake .
make 
chmod 777 ./main
#touch 1.conf
#echo "3" >> 1.conf
#echo "10 7" >> 1.conf
#echo "5 11" >> 1.conf
#echo "6 8" >> 1.conf
file="1.conf"
while read line; do
    parameters=()
    dlug=()
    amount=0
    ilo=()
    #echo -e "$line\n"
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    dlug+=(${parameters[0]})
    ilo+=(${parameters[1]})
    echo "`./main ${parameters[0]} ${parameters[1]} }`"
done <$file 
