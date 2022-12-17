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
	


        /*DLA CYKL*/

	int cykl[x];
	int wsk_z = 0;
	int wsk_z_2 = 0;
	int wsk_p = 0;
	int ile = 0;
	int miejsce = 0;

	char cykl_char[3*x];
	int ile_char = 0;
	int miejsce_char = 0;
	int ile_liczb = 0;
	int ile_nawiasow = 0;
	cykl_char[0] = '(';
	printf("%c", '(');
	ile_char++;
	miejsce_char++;


	for (int i = 0; i < x; i++)
	{
		if(zbior[wsk_z] == permutacja[wsk_p])
		{
			cykl[miejsce] = zbior[wsk_z];
			ile++;
			miejsce++;

			char c = zbior[wsk_z] + '0';
			cykl_char[miejsce_char] = c;
			ile_char++;
			miejsce_char++;
			ile_liczb++;

			printf("%d", zbior[wsk_z]);

			cykl_char[miejsce_char] = ')';
			ile_char++;
			miejsce_char++;
			ile_nawiasow++;

			printf("%c", ')');

			if(ile_liczb < x)
			{				
				cykl_char[miejsce_char] = '(';
				ile_char++;
				miejsce_char++;

				printf("%c", '(');
			}

			for (int k = 0; k < ile; k++)
			{	
				if(zbior[wsk_z_2] == cykl[k])
				{
					wsk_z_2++;
					k = 0;
				}
			}
			wsk_z = wsk_z_2;
			wsk_p = wsk_z_2;
		}
		else if(zbior[wsk_z] != permutacja[wsk_p])
		{
			if(permutacja[wsk_z] == zbior[wsk_z_2])
			{
				cykl[miejsce] = zbior[wsk_z];
				ile++;
				miejsce++;

				char c = zbior[wsk_z] + '0';
				cykl_char[miejsce_char] = c;
				ile_char++;
				miejsce_char++;
				ile_liczb++;

				printf("%d", zbior[wsk_z]);


				cykl_char[miejsce_char] = ')';
				ile_char++;
				miejsce_char++;
				ile_nawiasow++;

				printf("%c", ')');

				if(ile_liczb < x)
				{				
					cykl_char[miejsce_char] = '(';
					ile_char++;
					miejsce_char++;

					printf("%c", '(');
				}

				for (int k = 0; k < ile; k++)
				{	
					if(zbior[wsk_z_2] == cykl[k])
					{
						wsk_z_2++;
						k = 0;
					}
				}
				wsk_z = wsk_z_2;
				wsk_p = wsk_z_2;
			}

			else
			{
				cykl[miejsce] = zbior[wsk_z];
				ile++;
				miejsce++;

				char c = zbior[wsk_z] + '0';
				cykl_char[miejsce_char] = c;
				ile_char++;
				miejsce_char++;
				ile_liczb++;
				
				printf("%d ", zbior[wsk_z]);


				for (int j = 0; j < x; j++)
				{
					if(zbior[j] == permutacja[wsk_p])
					{
						wsk_z = j;
						wsk_p = j;	
						break;	
					}
				}

			}
		}
	}	


}
