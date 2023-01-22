#!/bin/bash
if ! [ -e ./test1.conf ]
then
	echo "Nie mozna znalesc pliku konfiguracyjnego test1.conf"
	exit 10
fi

needed_files=("cycle" "main" "next" "order" "parity" "previous" "square" "twoline") 
for need in ${needed_files[@]}
do
	if ! [ -e $need ]
	then
		echo "Nie mozna znalesc wymaganego pliku $need"
		exit 4
	fi
done
if [ -e ./test.tex ]
then
	rm test.tex
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
		rm -r PDF_OUTPUT
    		exit 11
    	fi
    done
    wazniejsza=$((${parameters[1]} + h))
    if [[ $wazniejsza -gt 40 ]]
    then
    	echo "Zbior nie moze przekraczac 40"
	rm -r PDF_OUTPUT
    	exit 14
    fi
    if [[ $wazniejsza -lt 0 ]]
    then
    	echo "Nie moze byc mniejszy niz 0"
	rm -r PDF_OUTPUT
    	exit 15
    fi
    
    touch test.tex
    chmod 777 test.tex

    echo "\documentclass[11pt,twoside,a4paper]{article}">>./test.tex
    echo "\usepackage[T1]{fontenc}">>./test.tex
    echo "\usepackage[utf8]{inputenc}">>./test.tex
    echo "\usepackage[polish]{babel}">>./test.tex
    echo "\usepackage{float}">>./test.tex
    echo "\restylefloat{table}">>./test.tex
    echo "\begin{document}">>./test.tex
    echo "\raggedright">>./test.tex
    echo "\section{Wstęp}">>./test.tex
    echo "\begin{itemize}">>./test.tex
    echo "\item Czas rozpoczęcia:">>./test.tex
    echo "\item Czas zakończenia:">>./test.tex
    echo "\item Nazwa pliku konfiguracyjnego:">>./test.tex
    echo "\item Lokalizacja wygenerowanych dokumentów:">>./test.tex
    echo "\item Lokalizacja testera:">>./test.tex
    echo "\end{itemize}">>./test.tex


    for ((i=2;i<$amount;i++))
    do
    	

    	mniejsza=$((${parameters[i]} + h))
    	rm 1.conf
	touch 1.conf
	chmod 777 1.conf
	rodzaj=$((${parameters[0]} + h))
	if [[ $wazniejsza -gt 35 ]]
    	then
    		echo "Zbior nie moze przekraczac 35"
		rm test.tex
		rm -r PDF_OUTPUT
    		exit 14
    	fi
    	if [[ $wazniejsza -lt 0 ]]
    	then
    		echo "Nie moze byc mniejszy niz 0"
		rm test.tex
		rm -r PDF_OUTPUT
    		exit 15
    	fi
	if [[ $mniejsza -gt 35 ]]
    	then
    		echo "Zbior nie moze przekraczac 35"
		rm test.tex
		rm -r PDF_OUTPUT
    		exit 14
    	fi
    	if [[ $mniejsza -lt 0 ]]
    	then
    		echo "Nie moze byc mniejszy niz 0"
		rm test.tex
		rm -r PDF_OUTPUT
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
		rm test.tex
		rm -r PDF_OUTPUT
		exit 12
    	fi
	

	#~ time.sh:
    	mkdir -p czastmp
	{ time ./start.sh 1 ; } 2> czastmp/tmp1.txt
	if ! [[ $? -eq 0 ]]
		then
		echo "Program start.sh sie nie wykonal"
		rm test.tex
		rm -r PDF_OUTPUT
		exit 9
	fi

	grep 'real' czastmp/tmp1.txt | grep -v 'user\|sys' >> wynik.txt
	sed -i -e 's/[real \t]*//' wynik.txt
	sed -i 's/m/\n/;s/s//' wynik.txt
	rm -r czastmp
    	#####

	echo "\section{Test 1}">>./test.tex
	echo "\begin{table}[H]">>./test.tex
	echo "\centering">>./test.tex
	echo "\begin{tabular}{|c|c|}">>./test.tex
	echo "\hline">>./test.tex
	echo "Typ testu & A \\\ \hline">>./test.tex
	echo "Rozmiar permutacji &  (zmienna) \\\ \hline">>./test.tex
	while read linia; do
		for czas in $linia; do
		echo "Czas & $czas \\\ \hline">>./test.tex
	done < wynik.txt
	echo "\end{tabular}">>./test.tex
	echo "\end{table}">>./test.tex

	gnuplot -persist <<-EOFMarker
    		set terminal png
    		set output 'test.png'
    		plot'wynik.txt' using 1: 2
	EOFMarker

	echo "\begin{figure}[H]">>./test.tex
	echo "\begin{center}">>./test.tex
	echo "\includegraphics[scale=0.7]{test.png}">>./test.tex
	echo "\end{center}">>./test.tex
	echo "\end{figure}">>./test.tex
	echo "\raggedright">>./test.tex
	rm wynik.txt
    done
    echo "\end{document}">>./test.tex
done < test1.conf
pdflatex test.tex
