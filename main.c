#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<stdbool.h>
#include<ctype.h>
#include<string.h>

int main (int argc,const char *const argv[])
{
/*
printf("%s",argv[1]);
*/

int dlugosc = atoi(argv[1]);
//printf("%d",dlugosc);
//printf("%d",ilosc);

	int x = dlugosc;
	int y = 1;
	
	int zbior[x];

	for (int i = 0; i < x; i++)
	{	
		zbior[i] = y;
		y++;
	}


	int permutacja[x];
	int cnt1 = x-1;

	for (int i = 0; i < x; i++)
	{

		srand(time(NULL));	
    	int l = rand() % (cnt1 + 1);

		permutacja[i] = zbior[l];
		
		int j = l;
		while(j < cnt1 + 1)
		{
			zbior[j] = zbior[j+1];
			j++;
		}
		zbior[cnt1] = cnt1 + 1;
		
		cnt1--;
	}
	

	
		for (int i = 0; i < x; i++) 
	{
		printf("%d ", permutacja[i]);
	}

	return 0;
}



