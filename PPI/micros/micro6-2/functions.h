
/* Maximum string length to be handled. '\0' included */
#define MAX_STR_LEN 128


/* Determines the number of occurences of palindromes in the array strings.
 * Stores all different palindromes in the array differentPalindromes
 *
 * @param strings                 array with pointers to strings
 * @param stringsLength           length of array strings
 * @param occurences              pointer where to store number of occurences
 * @param differentPalindromes    array of pointers to `string` that stores the different palindromes
 *
 */
void findPalindromes(const char **strings, const unsigned int stringsLength, unsigned int * const occurences, const char **differentPalindromes);

