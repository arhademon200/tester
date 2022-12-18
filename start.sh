#!/bin/bash
if ! [ -e ./1.conf ]
then
	echo "Nie mozna znalesc pliku konfiguracyjnego 1.conf"
	exit 2
fi
needed_files=("cycle.c" "main.c" "next.c" "order.c" "parity.c" "previous.c" "square.c" "twoline.c") 
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
echo "\usepackage{booktabs}">>./final.tex
echo "\usepackage{amsmath}">>./final.tex
echo "\begin{document}">>./final.tex

file="1.conf"
while read line; do
    parameters=()
    dlug=()
    amount=0
    ilo=()
    #echo -e "$line\n"
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    if ! [ $amount -eq 2 ]
    then
    	echo "Liczba parametrow jset wieksza lub mniejsza niz 2"
    	exit 1
    fi
       
    dlug+=(${parameters[0]})
    ilo+=(${parameters[1]})
    
    re='^[0-9]+$'
    if ! [[ $dlug =~ $re ]] ;then
    	echo "$dlug nie jest numerem"
    	exit 3
    fi
    if ! [[ $ilo =~ $re ]] ;then
    	echo "$ilo nie jest numerem"
    	exit 3
    fi
    for ((i=0;i<$ilo;i++))
    do
    ran=$RANDOM
    echo "\section{Permutacje zbioru $dlug -elementowego}">>./final.tex
    #echo "$ran"
    org=`./main ${parameters[0]} ${ran}`
    
    echo "\subsection{Permutacja ($org)}">>./final.tex
    echo "\begin{tabular}{|c|c|}">>./final.tex
    echo "\toprule">>./final.tex
    echo "Typ permutacji & Permutacja \\\\">>./final.tex
    
    
    echo "\midrule">>./final.tex
    echo "Zapis jednolinowy & ($org) \\\\">>./final.tex
    echo "\midrule">>./final.tex
    echo "Zapis dwuliniowy & \begin{equation*} \left(\begin{array}{@{}*{20}{c@{}}}`./twoline ${parameters[0]} $org`\end{array}\right) \end{equation*} \\\\">>./final.tex
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
