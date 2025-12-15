#include <stdio.h>
#include "functions.h"

int main(void)
{

  unsigned int numOfNums;
  scanf("%u", &numOfNums);

  for(unsigned int counter = 0; counter < numOfNums; counter++)
  {
    unsigned int number;
    scanf("%u", &number);

    dec2bin(number);
    printf("\n");
  }

  return 0;
}

