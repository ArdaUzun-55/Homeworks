#include <stdio.h>

int main(void)
{
  unsigned N;
  scanf("%u", &N);

  while (N--) {
    int x;
    int y;
    scanf("%d %d", &x, &y);
    printf("%d\n", x + y);
  }
  return 0;
}
