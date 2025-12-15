#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"


int main(void)
{
  unsigned int numOfStrings;
  scanf("%u", &numOfStrings);

  char *stringArray[numOfStrings];
  const char *palindromeArray[numOfStrings];
  char buf[MAX_STR_LEN];

  unsigned int counter = 0;

  for (counter = 0; counter < numOfStrings; counter++)
  {
    scanf("%s", buf);
    stringArray[counter] = (char *)malloc( (strlen(buf) + 1) * sizeof(char) );
    strcpy(stringArray[counter], buf);
    palindromeArray[counter] = NULL;
  }

  unsigned int occurences = 0xFF;

  findPalindromes((const char **)stringArray, numOfStrings, &occurences, palindromeArray);

  printf("%u\n", occurences);

  counter = 0;
  while (palindromeArray[counter] != NULL)
  {
    printf("%s\n", palindromeArray[counter]);
    counter++;
  }

  for (counter = 0; counter < numOfStrings; counter++)
  {
    free(stringArray[counter]);
  }

  return 0;
}

