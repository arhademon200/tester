#include <stdio.h>
#include <stdlib.h>

int main(int argc,const char *const argv[]) 
{
    int n = atoi(argv[1]);

    int silnia = 1;

    for (int i = 1; (i <= n) && (silnia <= 50); ++i) 
    {
            silnia *= i;
    }
    
    printf("%d", silnia);


    return 0;
}
