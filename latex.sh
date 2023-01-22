#!/bin/bash

rm test.tex
touch test.tex
chmod 777 test.tex

echo "\documentclass[11pt,twoside,a4paper]{article}">>./test.tex

echo "\usepackage[T1]{fontenc}">>./test.tex
echo "\usepackage[utf8]{inputenc}">>./test.tex
echo "\usepackage[polish]{babel}">>./test.tex
echo "\usepackage{float}">>./test.tex
echo "\restylefloat{table}">>./test.tex
echo "\usepackage{graphicx}">>./test.tex ###


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

#pętla

#jeżeli typ A
echo "\section{Test 1}">>./test.tex

echo "\begin{table}[H]">>./test.tex
echo "\centering">>./test.tex
echo "\begin{tabular}{|c|c|}">>./test.tex
echo "\hline">>./test.tex
echo "Typ testu & A \\\ \hline">>./test.tex
echo "Rozmiar permutacji & 3 (zmienna) \\\ \hline">>./test.tex
echo "Czas & 120s (zmienna) \\\ \hline">>./test.tex
echo "\end{tabular}">>./test.tex
echo "\end{table}">>./test.tex

gnuplot -persist <<-EOFMarker
    set terminal png
    set output 'test.png'
    plot'test.txt' using 1: 2
EOFMarker

echo "\begin{figure}[H]">>./test.tex
echo "\begin{center}">>./test.tex
echo "\includegraphics[scale=0.7]{test.png}">>./test.tex
echo "\end{center}">>./test.tex
echo "\end{figure}">>./test.tex

echo "\raggedright">>./test.tex

#jeżeli typ B
echo "\section{Test 2}">>./test.tex

echo "\begin{table}[H]">>./test.tex
echo "\centering">>./test.tex
echo "\begin{tabular}{|c|c|}">>./test.tex
echo "\hline">>./test.tex
echo "Typ testu & B \\\ \hline">>./test.tex
echo "Rozmiar zbioru & 12 \\\ \hline">>./test.tex
echo "Ilość permutacji & 100(zmienna) \\\ \hline">>./test.tex
echo "Czas & 120s (zmienna) \\\ \hline">>./test.tex
echo "\end{tabular}">>./test.tex
echo "\end{table}">>./test.tex
echo "\raggedright">>./test.tex


echo "\end{document}">>./test.tex

pdflatex test.tex
