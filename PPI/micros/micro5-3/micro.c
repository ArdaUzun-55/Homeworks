#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>
#include <string.h>


int main(void)
{
    int n, t;
    scanf("%d", &n);
    double a[n + 1];
    
    for(int i = 0; i <= n; i++)
    {
        scanf("%lf", &a[i]);
    }
    
    scanf("%d", &t);
    
    for(int j = 0; j < t; j++)
    {
        int m;
        double x;
        scanf("%d %lf", &m, &x);
        
        double result = 0.0;
        
        for(int i = m; i <= n; i++)
        {
            // Calculate falling factorial
            double factorial_term = 1.0;
            for(int k = 0; k < m; k++) {
                factorial_term *= (i - k);
            }
            
            // Calculate x^(i-m)
            double power = 1.0;
            for(int k = 0; k < (i - m); k++) {
                power *= x;
            }
            
            result += a[i] * factorial_term * power;
        }
        
        printf("%.3f\n", result);
    }
    
    return 0;
}