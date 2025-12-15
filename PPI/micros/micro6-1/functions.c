#include "functions.h"
#include <stdio.h>

unsigned int countOccurences(const int *array, const unsigned int *arrayLength, const int numOfInterest)
{
  int count = 0;
  for(unsigned int i = 0; i < *arrayLength; i++)
  {
  if(array[i] == numOfInterest)
  {
    count++;
  }
  }
  return count;
}


unsigned int countNumsAboveThreshold(const unsigned int arrayLength, const int *array, const int threshold)
{
  int count = 0;
  for (unsigned int i = 0; i < arrayLength; i++)
  {
    if(array[i] > threshold)
    {
      count++;
    }
  }
  return count;

}


void findFirstOccurence(const unsigned int arrayLength, const int *numOfInterest, const int *array, const int **firstOccurence)
{
  for(unsigned int i = 0; i < arrayLength; i++)
  {
    if(array[i] == *numOfInterest)
    {
      *firstOccurence = &array[i];
      break;
    }
  }
}

