#!/bin/bash
if ! [ -e ./1.conf ]
then
	echo "Nie mozna znalesc pliku konfiguracyjnego 1.conf"
	exit 2
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
if [ -a ./final.tex ]
then
	rm final.tex
fi
touch final.tex
chmod 777 final.tex

echo "\documentclass{article}">>./final.tex
echo "\usepackage[T1]{fontenc}">>./final.tex
echo "\usepackage{array}">>./final.tex
echo "\usepackage[margin=5pt]{geometry}">>./final.tex
echo "\usepackage{booktabs}">>./final.tex
echo "\usepackage{amsmath}">>./final.tex
echo "\begin{document}">>./final.tex

file="1.conf"
while read line; do
    parameters=()
    iloscall=0
    amount=0
    
    #echo -e "$line\n"
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    if ! [ $amount -eq 2 ]
    then
    	echo "Liczba parametrow jset wieksza lub mniejsza niz 2"
	rm final.tex
    	exit 1
    fi
    
    re='^[0-9]+$'
    if ! [[ ${parameters[0]} =~ $re ]] ;then
    	echo "${parameters[0]} nie jest numerem"
	rm final.tex
    	exit 3
    fi
    if ! [[ ${parameters[1]} =~ $re ]] ;then
    	echo "${parameters[1]} nie jest numerem"
	rm final.tex
    	exit 3
    fi
       
    dlug=$((${parameters[0]} + h))
    ilo=$((${parameters[1]} + h))
    if [[ $dlug -lt 1 ]]
    then
    	echo "Zbior nie moze byc mniejszy niz 1"
	rm final.tex
    	exit 7
    fi
    
    if [[ $ilo -lt 0 ]]
    then
    	echo "Ilosc premutacji nie moze byc mniejszy niz 0"
	rm final.tex
    	exit 8
    fi
    
    if [[ $ilo -eq 0 ]]
    then
    	alll=()
    	alll=`./factorial ${parameters[0]}`
	ilo=$((${alll} + h))
	iloscall=1
    fi
    
    if [[ $dlug -gt 40 ]]
    then
    	echo "Zbior nie moze przekraczac 40"
	rm final.tex
    	exit 5
    fi
    if [[ $ilo -gt 50 ]]
    then
    	echo "Ilosc premutacji nie moze przekraczac 50"
	rm final.tex
    	exit 6
    fi
    
    

    
    echo "\section{Permutacje zbioru $dlug -elementowego}">>./final.tex
    
    for ((i=0;i<$ilo;i++))
    do
    ran=$RANDOM
    #echo "$ran"
    if [ $iloscall -eq 1 ]
    then
    	org=`./allp ${parameters[0]} ${i}`
    else
    	org=`./main ${parameters[0]} ${ran}`
    fi
    
    echo "\subsection{Permutacja ($org)}">>./final.tex
    echo "\begin{tabular}{|c|c|}">>./final.tex
    echo "\toprule">>./final.tex
    echo "Typ & Permutacja \\\\">>./final.tex
    
    
    echo "\midrule">>./final.tex
    echo "Zapis jednolinowy & ($org) \\\\">>./final.tex
    echo "\midrule">>./final.tex
    echo "Zapis dwuliniowy &`./twoline ${parameters[0]} $org`\\\\">>./final.tex
    echo "\midrule">>./final.tex
    echo "Zapis cykliczny & `./cycle ${parameters[0]} $org` \\\\">>./final.tex
     echo "\midrule">>./final.tex
    echo "Kwadrat & `./square ${parameters[0]} $org` \\\\">>./final.tex
     echo "\midrule">>./final.tex
    echo "Nastepna & `./next ${parameters[0]} $org` \\\\">>./final.tex
     echo "\midrule">>./final.tex
    echo "Poprzednia & `./previous ${parameters[0]} $org` \\\\">>./final.tex
     echo "\midrule">>./final.tex
    echo "Parzystosc & `./parity ${parameters[0]} $org` \\\\">>./final.tex
     echo "\midrule">>./final.tex
    echo "Rzad & `./order ${parameters[0]} $org` \\\\">>./final.tex
    
    echo "\bottomrule">>./final.tex
    echo "\end{tabular}">>./final.tex
    
    done
done < $file 
echo "\end{document}">>./final.tex
