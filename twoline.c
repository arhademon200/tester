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
