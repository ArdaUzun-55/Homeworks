#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>

int main(void)
{
    int WieVieleZahlen;
    scanf("%d",&WieVieleZahlen);
    int Zahlen[WieVieleZahlen];
    for(int i = 0; i < WieVieleZahlen; i++)
    {
      scanf("%d",&Zahlen[i]);
    }
    int WieVieleGroestenZahlen;
    scanf("%d",&WieVieleGroestenZahlen);
    int groeste[WieVieleGroestenZahlen];
    for(int i = 0; i < WieVieleGroestenZahlen; i++)
    {
     groeste[i] = 0;
    }
     int biggestNumber;
    for(int i = 0; i < WieVieleZahlen; i++)
    {
        if(Zahlen[i] >  groeste[0])
        {
           groeste[0] = Zahlen[i];
           biggestNumber = i;
        }
    }
    Zahlen[biggestNumber] = 0;
    for(int i = 0; i < WieVieleZahlen; i++)
    {
        if(Zahlen[i] >  groeste[1] || groeste[1] == biggestNumber)
        {
           groeste[1] = Zahlen[i];
        }
    }
    for(int i = 0; i < WieVieleGroestenZahlen; i++)
    {
    printf("%d\n", groeste[i]);
    }
    return 0;
}
