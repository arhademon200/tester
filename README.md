# tester
zawartosc pliku test1.conf  
1 5 3 4 5  
2 10 20 20 30 40  
wyjasnienie  
1 - rodzaj testu, druga liczba to wielkosc zbioru a kolejne to ilosc permutacji  
2 - rodzaj testu, druga liczba to ilosc permutacji a kolejne to wielkosc zbioru  


# time.sh
time.sh uruchamia się zamiast start.sh <br />
skrypt działa jak start.sh, czyli czyta dane z pliku konfiguracyjnego przeznaczonego tylko dla generatora (dla testera trzeba jeszcze skonfigurować - inaczej na razie zapisuje tylko wynik jednego pomiaru w pliku wynik.txt) <br /> 
chmod 777 time.sh <br />
./time.sh <br />
Pomiar czasu jest w wynik.txt <br />

Przykładowa zawartość pliku wynik.txt: <br />
0 //liczba minut <br />
0,784 //liczba sekund <br />
