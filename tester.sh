#!/bin/bash
if ! [ -e ./test1.conf ]
then
	echo "Nie mozna znalesc pliku konfiguracyjnego test1.conf"
	exit 10
fi
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
    rodzaj=$((${parameters[0]} + h))
    if [[ $rodzaj -eq 1 ]]
    then



    elif [[ $rodzaj -eq 2 ]]
    then
	
	
	
    else
    	echo "Pierwsza liczba jest niepoprawna"
	exit 12
    fi
    
    
    
    wazniejsza=$((${parameters[1]} + h))
    
    #jesli zbiur
    if [[ $wazniejsza -lt 1 ]]
    then
    	echo "Zbior nie moze byc mniejszy niz 1"
    	exit 13
    fi
    if [[ $dlug -gt 40 ]]
    then
    	echo "Zbior nie moze przekraczac 40"
    	exit 14
    fi
    #jesli ilosc
    if [[ $ilo -lt 0 ]]
    then
    	echo "Ilosc premutacji nie moze byc mniejszy niz 0"
    	exit 15
    fi
    if [[ $ilo -gt 50 ]]
    then
    	echo "Ilosc premutacji nie moze przekraczac 50"
    	exit 16
    fi
    
    
    for ((i=0;i<$amount;i++))
    do
    	mniejsza=$((${parameters[i]} + h))
    	
    	
    	
    	
    	
    done
done < test1.conf
    
