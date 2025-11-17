#include <stdio.h>

int main(void)
{
  unsigned N;
  scanf("%u", &N);

  while (N--) {
    int x;
    int y;
    int z;
    scanf("%d %d %d", &x, &y, &z);
    printf("%d\n", x + y + z);
  }
  return 0;
}
