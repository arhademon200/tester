#!/bin/bash
chmod 777 CMakeLists.txt
chmod 777 ./start.sh
cmake .
make 
chmod 777 ./main
cd ..

