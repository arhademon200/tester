#!/bin/bash
needed_files=("cycle.c" "main.c" "next.c" "order.c" "parity.c" "previous.c" "square.c" "twoline.c") 
for need in ${needed_files[@]}
do
	if ! [ -e $need ]
	then
		echo "Nie mozna znalesc wymaganego pliku $need"
		exit 4
	fi
done
chmod 777 CMakeLists.txt
chmod 777 ./start.sh
cmake .
make 
chmod 777 ./main
