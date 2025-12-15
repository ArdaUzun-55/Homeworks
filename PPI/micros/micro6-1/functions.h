/* DISCLAIMER: 
 * The following functions are designed for teaching purposes.
 * Thus, the design of their interface (in particular, use of pointers) may
 * *not* comply with any recommended design rules.
 * I.e., in production programs it is *neither* recommended to switch function signatures
 * nor to use pointers for primitive input types as found here.
 */

/** Determines the number of occurences of numOfInterest in array and returns it. 
 *
 * @param array           A 1-D array with integers
 * @param arrayLength     Pointer to variable that stores length of array
 * @param numOfInterest   Number which occurences need to be counted
 *
 * @return Number of occurences
 *
 */
unsigned int countOccurences(const int *array, const unsigned int *arrayLength, const int numOfInterest);


/** Determines the number of numbers greater than threshold in array and returns it 
 *
 * @param arrayLength     Length of array
 * @param array           A 1-D array with integers
 * @param threshold       Threshold
 *
 * @return Number of numbers greater than threshold
 *
 */
unsigned int countNumsAboveThreshold(const unsigned int arrayLength, const int *array, const int threshold);


/** Determines the address of the first occurence of numOfInterest in array and stores it in 
 * firstOccurence
 *
 * @param arrayLength     Length of array
 * @param array           A 1-D array with integers
 * @param numOfInterest   Number whose first occurence needs to be detected
 * @param firstOccurence  Stores the address of the first occurence; NULL upon no match
 *
 */
void findFirstOccurence(const unsigned int arrayLength, const int *numOfInterest, const int *array, const int **firstOccurence);

