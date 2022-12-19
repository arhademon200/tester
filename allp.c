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
	int y = 1;	
	int zbior[x];

	for (int i = 0; i < x; i++)
	{	
		zbior[i] = y;
		y++;
	}

    int	ktory = atoi(argv[2]);

    bool jest_j = false;

    for(int all = 0; all < ktory; all++)
    {
        int n = x-1;
        int aj = 0;
        int ak = x;
        jest_j = false;
        int j = 0;
        int j_aj = 0;
        

        for (j = 0; 0 <= j && j <= n - 1; j++)
        {
            if(zbior[j] < zbior[j+1])
            {	if(j >= j_aj)
                {
                    aj = zbior[j];
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
                if(zbior[k] > aj && k > j_aj)
                    if(zbior[k] <= ak)
                    {
                        ak = zbior[k];
                        k_ak = k;
                    }
            }

            temp = zbior[j_aj];
            zbior[j_aj] = zbior[k_ak];
            zbior[k_ak] = temp;

            int m = x - j_aj;
            int z = j_aj+1;
            int w = x - 1;
            for(int i = 0; i < m/2 ; i++)
            {
                temp = zbior[z];
                zbior[z] = zbior[w];
                zbior[w] = temp;
                z++;
                w--;
            }
        }

    }

 
    for (int i = 0; i < x; i++) 
    {
        printf("%d ", zbior[i]);
    }

}	
