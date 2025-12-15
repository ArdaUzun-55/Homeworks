#include <stdio.h>
#include <string.h>
#include "functions.h"

int main(void)
{

  char buf[MAX_STR_LEN];

  scanf("%s", buf);

  perm(strlen(buf), buf);

  return 0;
}

