#!/bin/bash

if ! [ -e ./test1.conf ]

then

	echo "Nie mozna znalesc pliku konfiguracyjnego test1.conf"

	exit 10

fi

if [ -e ./test.tex ]

then

	rm test.tex
	if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie usunac test.tex"

		exit 9

	fi

fi

if [ -d PDF_OUTPUT ]; then

    rm -r PDF_OUTPUT
    if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie usunac PDF_OUTPUT"

		exit 9

	fi

fi
n=0
for ((b=0 ;b<11;b++ ))
do 
	if [ -e ./test$n.png ]
	then
		rm test$n.png
	fi
done

mkdir PDF_OUTPUT
if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie stworzyc PDF_OUTPUT"

		exit 9

	fi

    touch test.tex
    if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie stworzyc test.tex"

		exit 9

	fi

    chmod 777 test.tex

    echo "\documentclass[11pt,twoside,a4paper]{article}">>./test.tex

    echo "\usepackage[T1]{fontenc}">>./test.tex

    echo "\usepackage[utf8]{inputenc}">>./test.tex

    echo "\usepackage[polish]{babel}">>./test.tex

    echo "\usepackage{float}">>./test.tex

    echo "\restylefloat{table}">>./test.tex
    
    echo "\usepackage{graphicx}">>./test.tex

    echo "\begin{document}">>./test.tex

    echo "\raggedright">>./test.tex
    
    echo "\section{Wstęp}">>./test.tex
    
    echo "\begin{itemize}">>./test.tex
    
    czasRozpoczecia=`date +%T`>>./test.tex
    
    echo "\item Czas rozpoczęcia: $czasRozpoczecia">>./test.tex
    
    echo "\item Nazwa pliku konfiguracyjnego: test1.conf">>./test.tex
    
    lokalizacja=`pwd`>>./test.tex
    
    echo "\item Lokalizacja testera: $lokalizacja">>./test.tex
    
    echo "\item Lokalizacja wygenerowanych dokumentów: $lokalizacja/PDF\_OUTPUT">>./test.tex
    
    echo "\end{itemize}">>./test.tex
    
    h=0

while read line; do

    let h++
    if [[ $h -eq 10 ]]

		then

		echo "za duzo lini"

		rm test.tex

		rm -r PDF_OUTPUT

		exit 18

	fi

    parameters=()

    amount=0
    
    let n++

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

    

    rodzaj=$((${parameters[0]} + h))

    wazniejsza=$((${parameters[1]} + h))

    echo "\section{Test}">>./test.tex

    echo "\begin{table}[H]">>./test.tex

    echo "\centering">>./test.tex

    echo "\begin{tabular}{|c|c|}">>./test.tex

    echo "\hline">>./test.tex

    

    if [[ $rodzaj -eq 1 ]]

    	then

		echo "Rodzaj testu & A \\\ \hline">>./test.tex

		echo "Wielkosc zbioru & $wazniejsza  \\\ \hline">>./test.tex

		echo "Ilosc permutacji & Czas \\\ \hline">>./test.tex

		



   	elif [[ $rodzaj -eq 2 ]]

    	then

		echo "Rodzaj testu & B \\\ \hline">>./test.tex

		echo "Ilosc permutacji & $wazniejsza \\\ \hline">>./test.tex

		echo "Wielkosc zbioru & Czas \\\ \hline">>./test.tex

    fi



    for ((i=2;i<$amount;i++))

    do



    	mniejsza=$((${parameters[i]} + h))

    	

	if [ -e ./1.conf ]

	then

		rm 1.conf
		if ! [[ $? -eq 0 ]]

			then

			echo "nie udalo sie usunac 1.conf"

			exit 9

		fi

	fi

	touch 1.conf
	if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie utworzyc 1.conf"

		exit 9

	fi

	chmod 777 1.conf

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
	if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie utworzyc czastmp"

		exit 9

	fi

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

	

	##

	read min < wynik.txt
	if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie odczytac z wyniki.txt"

		rm test.tex

		rm -r PDF_OUTPUT

		exit 9

	fi

	sec=$(sed '2q;d' wynik.txt)

	

	czasowy=0

	if [ $min -eq 0 ]

	then

		#czasowy=$(($czasowy*1000))

		for (( g=1; $g <= 10 ; g++ ));

		do

 			 czasowy=$(($czasowy + $sec));

		done

	else

    		min=$(($min*60))

   		awk "BEGIN {print $min + $sec; exit}" >> czastmp/tmp2.txt

    		czasowy=`cat czastmp/tmp2.txt`

    		czasowy="${czasowy// /,}"

    		for (( g=1; $g <= 10 ; g++ ));

		do

 			 czasowy=$(($czasowy + $sec));

		done

    		#czasowy=$(($czasowy + h))

    		#czasowy=$(($czasowy*1000))

	fi

	rm -r czastmp

    	#####





	echo "$mniejsza & $czasowy \\\ \hline">>./test.tex

	

	touch dane.txt
	if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie utworzyc dane.txt"

		rm test.tex

		rm -r PDF_OUTPUT

		exit 9

	fi

	chmod 777 dane.txt

	echo "$mniejsza $czasowy" >> dane.txt

	rm wynik.txt

    done

    echo "\end{tabular}">>./test.tex

    echo "\end{table}">>./test.tex

    

gnuplot -persist <<-EOFMarker

    set terminal png

    set output 'test$n.png'

    plot'dane.txt' using 1: 2

EOFMarker

    

    echo "\begin{figure}[H]">>./test.tex

    echo "\begin{center}">>./test.tex

    echo "\includegraphics[scale=0.7]{test$n.png}">>./test.tex

    echo "\end{center}">>./test.tex

    echo "\end{figure}">>./test.tex

    echo "\raggedright">>./test.tex
 

rm dane.txt    

done < test1.conf

 echo "\end{document}">>./test.tex

if ! [[ $? -eq 0 ]]

		then

		echo "nie udalo sie odczytac test1.conf"

		rm test.tex

		rm -r PDF_OUTPUT

		exit 9

	fi
