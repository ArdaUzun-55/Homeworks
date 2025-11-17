#include <stdio.h>

int main(void)
{
    unsigned short int a, e, f;
    int  b, c, d;
    int g, h;
    scanf("%hu", &a);
    scanf("%d %d %d", &b, &c, &d);
    scanf("%hu %hu %d", &e, &f, &g);
    scanf("%d", &h);
    printf("%d\n",a + b);
    printf("%d\n",c - d);
    printf("%d\n",e * f);
    printf("%d\n", g % h);
    return 0;
}
