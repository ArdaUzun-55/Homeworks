#include <stdio.h>
#include <string.h>
#include "functions.h"

int main(void)
{
  unsigned int numOfCalculations;

  scanf("%u", &numOfCalculations);

  while (numOfCalculations-- != 0)
  {
    unsigned int command;
    scanf("%u", &command);

    const execute_t *exec = getCmd(command);

    result_t *result;

    if (exec != NULL && exec->func != NULL)
    {
      result = exec->func(exec->param);
    }

    if ( result != NULL && result->type == INTEGER )
    {
      printf("%d\n", result->intValue);
    }
    else
    {
      printf("Didn't recognize the result type");
    }
  }

  return 0;
}

