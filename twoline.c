
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
		int dlg_z = floor(log10(zbior[licznik+1])) + 1;

		if(licznik == x-1)
			printf("%d ", zbior[licznik]);
		else
		{
			printf("%d", zbior[licznik]);
			if (dlg_z == 1)
				printf("  ");
			else
				printf(" ");
		}
		licznik++;
	}

	printf("\\");
	printf("\\");
	printf("\n");
	printf("& ");

	int licznik_2 = 0;
	while(licznik_2 < x)
	{	
		int dlg_p = floor(log10(permutacja[licznik_2+1])) + 1;

		if(licznik == x-1)
			printf("%d ", permutacja[licznik_2]);
		else
		{
			printf("%d", permutacja[licznik_2]);
			if (dlg_p == 1)
				printf("  ");
			else
				printf(" ");
		}
		licznik_2++;
	}

	printf("\\");


	return 0;

}
