#include <stdio.h>
#include <math.h>

int main(void)
{
    double a;
    double b;
    double c;
    double x;
    double y;
    double dist;
    scanf("%lf %lf %lf", &c, &b, &a);
    x = -b / (2 * a);
    printf("%.4lf\n", x);
    y = a * x * x + b * x + c;
    printf("%.4lf\n", y);
    dist = (-(b / a)/2 + sqrt(pow((b / a)/2,2)-(c / a))) - x;
    printf("%.4lf", dist);
    return 0;
}
