// Header einbinden
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>
// Konstanten/ Definitionen/ Macros
#define MAXIMUMPLAYERS  5 
#define WURMLOCHMAX  10  
#define WORMHOLES  3  
// Aufruf Main-Funktion
int main(void) {
    int Position[MAXIMUMPLAYERS] = {0,0,0,0,0};
    int ZusMitspieler;
    char Names[MAXIMUMPLAYERS][21];
    int Alter[MAXIMUMPLAYERS];
    unsigned Startwert;
    scanf("%u", &Startwert);
  srand(Startwert); 
    do{
    scanf("%d", &ZusMitspieler);
    if(ZusMitspieler > MAXIMUMPLAYERS || ZusMitspieler < 0 )
    {
        printf("ERROR: MAX Anzahl\n");
    }
    }while(ZusMitspieler > MAXIMUMPLAYERS || ZusMitspieler < 0);
    strcpy(Names[0], "Cebra");
    strcpy(Names[1], "Monty");
    for(int i = 2; i < 2 + ZusMitspieler; i++) //Alter einlesen und Name einlesen
    {
        scanf("%s %d",Names[i], &Alter[i]);
    }
    printf("Spieler: Cebra Monty ");
    for (int i = 2; i < MAXIMUMPLAYERS; i++)
     {
    printf("%s-%d ", Names[i], Alter[i]);
    }
printf("\n");
int start;
char row;
int column;
if(0 == ZusMitspieler)
{

int roll = rand() % 6 + 1;
if (roll == 1 || roll == 2)
{
     start = 1; // Monty
}
else
 {
    start = 0; // Cebra
 }
}
else
{
    int youngest = Alter[2];
start = 2;
for (int i = 3; i < 2 + ZusMitspieler; i++) {
    if (Alter[i] < youngest) {
        youngest = Alter[i];
        start = i;
    }
}
}
printf("Start: %s\n", Names[start]);
char start_row[WORMHOLES], end_row[WORMHOLES];
int start_col[WORMHOLES], end_col[WORMHOLES];
for(int i = 0; i < WORMHOLES; i++) 
{
    scanf(" %c %d; %c %d", &start_row[i], &start_col[i], &end_row[i], &end_col[i]);
    // Then store in your Wormholes array as needed
}
bool win = false;
char Field[WURMLOCHMAX]; 
while(win == false)
{
  int roll = rand() % 6 + 1;
  Position[start] += roll;
  row = 'A' + (Position[start] / WURMLOCHMAX);
column = (Position[start] - 1) % 10 + 1;
  for(int i = 0; i < WORMHOLES; i++) // Wormholes vergleichen
    {
        if(row == start_row[i] && column == start_col[i])
        {
            row = end_row[i];
            column = end_col[i];
            int row_index = row - 'A';
            Position[start] = (row_index * 10) + (column - 1);
        }
    else if(row == end_row[i] && column == end_col[i]) {
        // Teleport to start  
        row = start_row[i];
        column = start_col[i];
        Position[start] = ((start_row[i] - 'A') * 10) + (start_col[i] - 1);
    }

    
}
  snprintf(Field, sizeof(Field), "%c %d", row, column);
  if(Position[start] >= 50)
  {
    printf("%s hat gewonnen!\n", Names[start]);
    win = true;
    break;
  }
  else
  {
    printf("Spieler: %s; Zahl: %d; Position: %s\n", Names[start], roll, Field);
  }
  start++;
  if(start == 5)
  {
    start = 0;
  }
  
}
    return 0;
}