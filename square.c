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
	
	/*KWADRAT*/
	
	int kwadrat[x];
	int wzk;
	
	for (int i = 0; i < x; i++)
	{
			for (int j=0; j < x; j++)
			{
					if(permutacja[i] == zbior[j])
					{
							kwadrat[i] = permutacja[j];
					}
			}
	}
	
	for (int i = 0; i < x; i++) 
	{
		printf("%d ", kwadrat[i]);
	}
	printf("\n");

	
	
	return 0;
}
