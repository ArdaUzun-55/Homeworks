#include <stdio.h>

int main(void)
{
    int a, b;
    float c;
    scanf("%d %d %f", &a, &b, &c);
    printf("%d\n",(a/b + (int)c));
    printf("%.3f\n",(a/b +c));
    printf("%.3f\n",((a/b) /c));
    return 0;
}
