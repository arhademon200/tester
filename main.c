#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<stdbool.h>
#include<ctype.h>

int main()
{

	int x;
	int y = 1;
	printf("Podaj dlugosc zbioru: ");
	scanf("%d", &x);
	
	int zbior[x];

	for (int i = 0; i < x; i++)
	{	
		zbior[i] = y;
		y++;
	}
	
	for (int i = 0; i < x; i++) 
	{
		printf("%d ", zbior[i]);
	}
	printf("\n");

	int permutacja[x];
	int cnt1 = x-1;

	for (int i = 0; i < x; i++)
	{

		srand(time(NULL));	
    	int l = rand() % (cnt1 + 1);
    	printf("Losowa liczba: %d \n", l);

		permutacja[i] = zbior[l];
		
		int j = l;
		while(j < cnt1 + 1)
		{
			zbior[j] = zbior[j+1];
			j++;
		}
		zbior[cnt1] = cnt1 + 1;
			
		for (int i = 0; i < x; i++) 
		{
			printf("%d ", zbior[i]);
		}
		printf("\n");
	
		for (int i = 0; i < x; i++) 
		{
			printf("%d ", permutacja[i]);
		}
		printf("\n");	
		
		
		cnt1--;
	}
	

	for (int i = 0; i < x; i++) 
	{
		printf("%d ", zbior[i]);
		
		int dlg_z = floor(log10(zbior[i])) + 1;
		int dlg_p = floor(log10(permutacja[i])) + 1;
		if (dlg_z < dlg_p)
		{
			int cnt = dlg_p - dlg_z;
			while (cnt < dlg_p)
			{
				printf(" ");
				cnt++;
			}
		
		}
	}
	printf("\n");
	
		for (int i = 0; i < x; i++) 
	{
		printf("%d ", permutacja[i]);
	}
	printf("\n");
	return 0;
}
