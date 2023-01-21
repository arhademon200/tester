#!/bin/bash

mkdir -p czastmp
{ time ./start.sh 1 ; } 2> czastmp/tmp1.txt

grep 'real' czastmp/tmp1.txt | grep -v 'user\|sys' > wynik.txt
sed -i -e 's/[real \t]*//' wynik.txt
sed -i 's/m/\n/;s/s//' wynik.txt
rm -r czastmp
