#include <stdio.h>
#include <string.h>

int main(void)
{
    unsigned int K;
    char P[30];
    char decrypted[30];
    scanf("%u",&K);
    scanf("%s",P);
    unsigned i;
    for(i = 0; P[i] != '\0';i++)
    {
     decrypted[i] = 32 + ((P[i] - K - 32 + 96) % 96);

    }
    decrypted[i] = '\0';  
  printf("%s\n",decrypted);
  return 0;
}
