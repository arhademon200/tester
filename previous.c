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


	/* POPRZEDNIA */

    int n = x-1;
    int aj = 0;
    int ak = 0;
    bool jest_j = false;
    int j = 0;
    int j_aj = 0;
        

    for (j = 0; 0 <= j && j <= n - 1; j++)
    {
        if(permutacja[j] > permutacja[j+1])
        {	if(j >= j_aj)
            {
                aj = permutacja[j];
                j_aj = j;
                jest_j = true;
            }	
        }
    }

    int temp;
    int k_ak;

    if(jest_j == true)
    {
        for (int k = 0; k < x; k++)
        {
            if(permutacja[k] < aj && k > j_aj)
                if(permutacja[k] >= ak)
                {
                    ak = permutacja[k];
                    k_ak = k;
                }
        }

        temp = permutacja[j_aj];
        permutacja[j_aj] = permutacja[k_ak];
        permutacja[k_ak] = temp;

        int m = x - j_aj;
        int z = j_aj+1;
        int w = x - 1;
        for(int i = 0; i < m/2 ; i++)
        {
            temp = permutacja[z];
            permutacja[z] = permutacja[w];
            permutacja[w] = temp;
            z++;
            w--;
        }



    }   

    if(jest_j == true)
    {
        for (int i = 0; i < x; i++) 
        {
            printf("%d ", permutacja[i]);
        }
    }
    else
        printf("Nie ma.");


    


}	
