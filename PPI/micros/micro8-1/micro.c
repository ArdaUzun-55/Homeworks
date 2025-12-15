#include <stdio.h>
#include <string.h>
#include "functions.h"

cmd_t funcArray[NUM_FUNCS];

int main(void)
{
  unsigned int numOfCalculations;

  init(funcArray);
  scanf("%u", &numOfCalculations);

  while (numOfCalculations-- != 0)
  {
    unsigned int command;
    scanf("%u", &command);
    if (command < NUM_FUNCS)
    {
      calculate(command, funcArray);
    }
    else
    {
      unsigned int a, b;
      scanf("%u %u", &a, &b);
      swap(a, b, funcArray);
    }
  }

  return 0;
}

