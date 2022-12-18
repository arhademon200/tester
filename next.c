#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<math.h>


int main (int argc,const char *const argv[])
{
/*
printf("%s",argv[1]);
*/

	int dlugosc = atoi(argv[1]);
	int x = dlugosc;

	int permutacja[dlugosc];
	int p = 0;
	
	for (int o = 2; o < dlugosc + 2; o++)
	{
		permutacja[p] = atoi(argv[o]);
		p++;
	}

	/* NASTEPNA */

	bool nsp = true;
	int k = x-1;
    while(nsp)
    {
		if(k == 0)
		{
			printf("Nie ma nastepnej permutacji.\n");
			nsp = false;
			break;
		}
		
		else if(permutacja[k-1] < permutacja[k])
		{   
			int tmp = permutacja[k];
			permutacja[k] = permutacja[k-1];
			permutacja[k-1] = tmp;
			break;
		}
		k--;

		
    }

	if(nsp == true)
    {
		for (int i = 0; i < x; i++) 
		{
			printf("%d ", zbior[i]);
		}
	}
}	
