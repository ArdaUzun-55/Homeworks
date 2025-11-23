#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>


int main(void)
{
int n, t;
scanf("%d",&n);
int a[n+1];
for(int i = 0; i < (n+1); i++)
{
    scanf("%d",&a[i]);
}
scanf("%d",&t);
int x[n];
float result[t];
    for(int i = 0; i < t; i++)
    {
     result[i] = 0;
    }
for(int i = 0; i < t; i++)
{
    scanf("%d",&x[i]);
}
for(int i = 0; i < t; i++)
{
    float power = 1.0;
for(int s = 0; s <= n; s++)
{
    result[i] += a[s] * power;
    power *= x[i];
}
}
    for(int i = 0; i < t; i++)
    {
    printf("%.3f\n", result[i]);
    }
  return 0;
}
