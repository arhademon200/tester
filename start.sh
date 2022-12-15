#!/bin/bash
#touch 1.conf
#echo "3" >> 1.conf
#echo "10 7" >> 1.conf
#echo "5 11" >> 1.conf
#echo "6 8" >> 1.conf
file="1.conf"
pLength=()
while read line; do
    parameters=()
    amount=0
    lines=()
    echo -e "$line\n"
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    pLength+=(${parameters[0]})
    lines+=(${parameters[1]})
   
    
    #echo -e "$parameters\n"
    #echo -e "$lines\n"
    #echo -e "$amount\n"
    #echo -e "$pLength\n"
    
done <$file


chmod 777 CMakeLists.txt
cmake .
make 
chmod 777 ./main.c


echo -e "`./main.c ${parameters[1]}`"
