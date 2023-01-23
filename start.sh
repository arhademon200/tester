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

istnieje=0
for ((b=0 ;$istnieje==0; ))
do 
	b=$(($b + 1))
	if ! [ -f ./PDF_OUTPUT/final$b.tex ]
	then
		touch ./PDF_OUTPUT/final$b.tex
		chmod 777 ./PDF_OUTPUT/final$b.tex
		istnieje=1
	fi
done

echo "\documentclass{article}">>./PDF_OUTPUT/final$b.tex
echo "\usepackage[T1]{fontenc}">>./PDF_OUTPUT/final$b.tex
echo "\usepackage{array}">>./PDF_OUTPUT/final$b.tex
echo "\usepackage[margin=5pt]{geometry}">>./PDF_OUTPUT/final$b.tex
echo "\usepackage{booktabs}">>./PDF_OUTPUT/final$b.tex
echo "\usepackage{amsmath}">>./PDF_OUTPUT/final$b.tex
echo "\begin{document}">>./PDF_OUTPUT/final$b.tex

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
    
    dlug=$((${parameters[0]} + h))
    ilo=$((${parameters[1]} + h))
    
    if [[ $ilo -eq 0 ]]
    then
    	alll=()
    	alll=`./factorial ${parameters[0]}`
	ilo=$((${alll} + h))
	iloscall=1
    fi
    
    echo "\section{Permutacje zbioru $dlug -elementowego}">>./PDF_OUTPUT/final$b.tex
    
    for ((i=0;i<$ilo;i++))
    do
    ran=$RANDOM
    #echo "$ran"
    if [ $iloscall -eq 1 ]
    then
    	org=`./allp ${parameters[0]} ${i}`
    	if ! [[ $? -eq 0 ]]
		then
		echo "Program allp.c sie nie wykonal"
		rm final.tex
		exit 9
	fi
    else
    	org=`./main ${parameters[0]} ${ran}`
    	if ! [[ $? -eq 0 ]]
		then
			echo "Program main.c sie nie wykonal"
			rm final.tex
			exit 10
		fi
    fi
    
    
    
    echo "\subsection{Permutacja ($org)}">>./PDF_OUTPUT/final$b.tex
    echo "\begin{center}">>./PDF_OUTPUT/final$b.tex
    echo "\centering">>./PDF_OUTPUT/final$b.tex
    echo "\begin{tabular}{|c|c|}">>./PDF_OUTPUT/final$b.tex
    echo "\toprule">>./PDF_OUTPUT/final$b.tex
    echo "Typ & Permutacja \\\\">>./PDF_OUTPUT/final$b.tex
    
    
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Zapis jednolinowy & ($org) \\\\">>./PDF_OUTPUT/final$b.tex
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Zapis dwuliniowy &`./twoline ${parameters[0]} $org`\\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program twoline sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Zapis cykliczny & `./cycle ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program cycle sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Kwadrat & `./square ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program square sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Poprzednia & `./previous ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program previous sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Nastepna & `./next ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program next sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Parzystosc & `./parity ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program parity sie nie wykonal"
		rm final.tex
		exit 9
	fi
    echo "\midrule">>./PDF_OUTPUT/final$b.tex
    echo "Rzad & `./order ${parameters[0]} $org` \\\\">>./PDF_OUTPUT/final$b.tex
    if ! [[ $? -eq 0 ]]
		then
		echo "Program order sie nie wykonal"
		rm final.tex
		exit 9
	fi
    
    echo "\bottomrule">>./PDF_OUTPUT/final$b.tex
    echo "\end{tabular}\par">>./PDF_OUTPUT/final$b.tex
    echo "\end{center}">>./PDF_OUTPUT/final$b.tex
    
    done
done < $file 
echo "\end{document}">>./PDF_OUTPUT/final$b.tex
