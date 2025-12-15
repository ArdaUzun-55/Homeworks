#include <stdio.h>
#include "functions.h"

int main(void)
{
  unsigned int numOfNums;
  scanf("%u", &numOfNums);

  int numArray[numOfNums];

  for (unsigned int counter = 0; counter < numOfNums; counter++)
  {
    scanf("%d", (numArray + counter));
  }

  int num2lookFor;
  scanf("%d", &num2lookFor);

  unsigned int occurences = countOccurences(numArray, &numOfNums, num2lookFor);
  printf("%d\n", occurences);

  unsigned int numsAboveThreshold = countNumsAboveThreshold(numOfNums, numArray, num2lookFor);
  printf("%u\n", numsAboveThreshold);

  const int *addressOfFirstOccurence = numArray; 

  findFirstOccurence(numOfNums, &num2lookFor, numArray, &addressOfFirstOccurence);

  if ( addressOfFirstOccurence != NULL )
  {
    printf("%ld\n", (long)(addressOfFirstOccurence - numArray));
    return 0;
  }

  return 1;
}

