// Header einbinden
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
// Definition Konstanten
#define Grundteig  500
#define Zucker  50
#define Quark  150

// Hauptfunktion
int main (void) {

    unsigned A;
    unsigned N;
    unsigned S;
    char c;
    do{ // repeat if the start button is not pressed
    scanf("%u", &A);
    do{ // repeat if N is not a specified Recipe
    scanf("%u", &N);
    printf("Anzahl: %d\n", A);
    if(N == 1)
    {
        printf("Programm: Brot\n");
    }
    else if(N == 2)
    {
        printf("Programm: Muffin\n");
    }
    else if(N == 3)
    {
        printf("Programm: Torte\n");
    }
    else 
    {
        printf("Error: Backprogramm. Auswahl: Brot = 1; Muffin = 2; Torte = 3\n");
    }
}while(N != 1 && N != 2 && N != 3);
    int GesamtMasse;
    if(N >= 1)
    {
    GesamtMasse = Grundteig;
    if(N >= 2)
    {
        GesamtMasse += Zucker;
        if(N == 3)
        {
            GesamtMasse += Quark;
        } 
    }
    }
    int Backzeit;
    Backzeit = A * GesamtMasse * 3;
    printf("Backzeit: %d:%d\n", (Backzeit / 60),(Backzeit % 60));
    printf("");
    scanf("%u", &S);
    }while(S == 0);
    printf("Backen\n");
    for (unsigned i = 1; i <= A; i++) // bake 
    {
        do
    {
    printf("Anzahl fertig: %d\n", i);
    if(i < A)
    {
    printf("Backvorgang fortsetzen? (j/n)\n");
    }
    scanf(" %c", &c);
    if(c == 'n')
    {
        printf("Abbruch\n");
       break;
    }
    else if(c != 'n' && c != 'j')
    {
        printf("ERROR: Falsche Eingabe\n");
    }
    else{}
}while(c != 'n' && c != 'j');
}
if(N == 3)
{
    printf("Sahne\n");
}
printf("Ende\n");
    return 0;
}
