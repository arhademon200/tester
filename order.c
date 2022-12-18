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
	
	

    /*DLA RZAD*/

	int zlozenie[x];
	int wzk;
	bool dopoki = true;
	int rzad = 1;

	for (int i = 0; i < x; i++)
		zlozenie[i] = permutacja[i];

	int zlozenie_2[x];

	while(dopoki)
	{
		for (int i = 0; i < x; i++)
		{
				for (int j=0; j < x; j++)
				{
						if(zlozenie[i] == zbior[j])
						{
								zlozenie_2[i] = permutacja[j];
						}
				}
		}
		for (int i = 0; i < x; i++)
			zlozenie[i] = zlozenie_2[i];

		rzad++;

		int licznik = 0;

		for (int i = 0; i < x; i++)
		{
			if(zlozenie[i] == zbior[i])
				licznik++;
		}
	
		if(licznik == x)
			break;
	}


	printf("%d", rzad);

	return 0;

}
