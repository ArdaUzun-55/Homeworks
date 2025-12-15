#include "functions.h"
#include "string.h"
#include "stdio.h"
#include <stdbool.h>


void findPalindromes(const char **strings, const unsigned int stringsLength, unsigned int * const occurences, const char **differentPalindromes)
{
    char reversedString[100];
    for(unsigned i = 0; i < stringsLength; i++)
    {
        unsigned int len = strlen(strings[i]);
        for(unsigned int j = 0; j < len; j++)
        {
            reversedString[j] = strings[i][len - 1 - j];
        }
        reversedString[len] = '\0';

        if(strcmp(strings[i], reversedString) == 0)
        {
            bool isDifferent = true;
            for(unsigned int k = 0; k < *occurences; k++)
            {
                if(strcmp(differentPalindromes[k], strings[i]) == 0)
                {
                    isDifferent = false;
                    break;
                }
            }
            if(isDifferent)
            {
                differentPalindromes[*occurences] = strings[i];
                (*occurences)++;
            }
        }
    }
}

