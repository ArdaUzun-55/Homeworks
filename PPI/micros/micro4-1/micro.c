#include <stdio.h>

int main(void)
{
    int a, b, c;
    scanf("%d %d %d", &a, &b, &c);
    int ShowNumber;
    if(a >= b || a >= c)
    {
      ShowNumber = a;
      if(c >= a)
      {
      ShowNumber = c;
      }
    }
    if(b >= a)
    {
        ShowNumber = b;
      if(c >= b)
      {
      ShowNumber = c;
      }
    }
    printf("%d\n",(ShowNumber));
    return 0;
}
