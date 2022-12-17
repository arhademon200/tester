#!/bin/bash
chmod 777 CMakeLists.txt
chmod 777 ./start.sh
mkdir make
cd make
cmake .
make 
chmod 777 ./main
cd ..

