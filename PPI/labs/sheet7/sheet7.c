#include <stdio.h>
#include <limits.h>

#include "fcn_sheet7.h"

#define MAX_PLACES  10

int main(void)
{
  unsigned numPois;
  unsigned dist[(MAX_PLACES + 1) * (MAX_PLACES + 1)];
  unsigned best;

  readMarket(&numPois, dist);

  best = findRoute(numPois, dist);

  if (best < UINT_MAX) {
    printf("%u\n", best);
  } else {
    printf("IMPOSSIBLE\n");
  }
  
  return 0;
}
