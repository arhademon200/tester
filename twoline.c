#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<stdbool.h>
#include<ctype.h>

int main (int argc,const char *const argv[])
{
/*
printf("%s",argv[1]);
*/

	int dlugosc = atoi(argv[1]);
	int x = dlugosc;
	int y = 1;	
	int zbior[x];

	for (int i = 0; i < x; i++)
	{	
		zbior[i] = y;
		y++;
	}


	int permutacja[dlugosc];
	int p = 0;
	
	for (int o = 2; o < dlugosc + 2; o++)
	{
		permutacja[p] = atoi(argv[o]);
		p++;
	}




	

    /*DWULINIOWY*/

	int licznik = 0;
	while(licznik < x)
	{
		if(licznik == x-1)
			printf("%d ", zbior[licznik]);
		else
			printf("%d & ", zbior[licznik]);
		licznik++;
	}

	printf("\\");
	printf("\\");
	printf("\n");

	int licznik_2 = 0;
	while(licznik_2 < x)
	{	
		if(licznik_2 == x-1)
			printf("%d ", permutacja[licznik_2]);
		else
			printf("%d & ", permutacja[licznik_2]);
		licznik_2++;
	}

	printf("\\");
	printf("\\");


	return 0;

}
