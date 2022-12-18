#!/bin/bash
rm final.tex
touch final.tex
chmod 777 final.tex

echo "\documentclass{article}">>./final.tex
echo "\usepackage[T1]{fontenc}">>./final.tex
echo "\usepackage{array}">>./final.tex
echo "\usepackage{booktabs}">>./final.tex
echo "\begin{document}">>./final.tex

file="1.conf"
while read line; do

    echo "\section{permutacja}">>./final.tex
    parameters=()
    dlug=()
    amount=0
    ilo=()
    #echo -e "$line\n"
    for value in $line; do
        parameters+=($value)
        let amount++
    done
    
    dlug+=(${parameters[0]})
    ilo+=(${parameters[1]})
    
    for ((i=0;i<$ilo;i++))
    do
    ran=$RANDOM
    #echo "$ran"
    org=`./main ${parameters[0]} ${ran}`
    
    echo "\begin{tabular}{|c|c|}">>./final.tex
    echo "\toprule">>./final.tex
    echo "Typ permutacji & Permutacja \\\\">>./final.tex
    
    
    echo "\midrule">>./final.tex
    echo "Podstawowa & ($org) \\\\">>./final.tex
    echo "\midrule">>./final.tex
    echo "Podstawowa & `./cycle ${parameters[0]} $org` \\\\">>./final.tex
    
    
    echo "\bottomrule">>./final.tex
    echo "\end{tabular}">>./final.tex
    
    done
done < $file 
echo "\end{document}">>./final.tex
