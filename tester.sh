#!/bin/bash
if ! [ -e ./test1.conf ]
then
	echo "Nie mozna znalesc pliku konfiguracyjnego test1.conf"
	exit 10
fi

if [ -e ./wynik.txt ]
then
	rm wynik.txt
fi

if [ -d PDF_OUTPUT ]; then
    rm -r PDF_OUTPUT
fi

mkdir PDF_OUTPUT

while read line; do
    parameters=()
    amount=0
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    re='^[0-9]+$'
    for ((i=0;i<$amount;i++))
    do
    	if ! [[ ${parameters[i]} =~ $re ]] ;then
    		echo "${parameters[i]} nie jest numerem"
		rm final.tex
    		exit 11
    	fi
    done
    wazniejsza=$((${parameters[1]} + h))
    if [[ $wazniejsza -gt 40 ]]
    then
    	echo "Zbior nie moze przekraczac 40"
    	exit 14
    fi
    if [[ $wazniejsza -lt 0 ]]
    then
    	echo "Nie moze byc mniejszy niz 0"
    	exit 15
    fi
    for ((i=2;i<$amount;i++))
    do
    	mniejsza=$((${parameters[i]} + h))
    	rm 1.conf
	touch 1.conf
	chmod 777 1.conf
	rodzaj=$((${parameters[0]} + h))
	if [[ $wazniejsza -gt 40 ]]
    	then
    		echo "Zbior nie moze przekraczac 40"
    		exit 14
    	fi
    	if [[ $wazniejsza -lt 0 ]]
    	then
    		echo "Nie moze byc mniejszy niz 0"
    		exit 15
    	fi
    	if [[ $rodzaj -eq 1 ]]
    	then
		echo "$wazniejsza $mniejsza" >> 1.conf
		

   	elif [[ $rodzaj -eq 2 ]]
    	then
		echo "$mniejsza $wazniejsza" >> 1.conf
	
	
    	else
    		echo "Pierwsza liczba jest niepoprawna"
		exit 12
    	fi
	

	#~ time.sh:
    	mkdir -p czastmp
	{ time ./start.sh 1 ; } 2> czastmp/tmp1.txt

	grep 'real' czastmp/tmp1.txt | grep -v 'user\|sys' >> wynik.txt
	sed -i -e 's/[real \t]*//' wynik.txt
	sed -i 's/m/\n/;s/s//' wynik.txt
	rm -r czastmp
    	#####
    	
    done
done < test1.conf
    
