
/* Number of functions to be handled */
#define NUM_FUNCS 3

typedef void (*cmd_t)(const int *,const int *);

/* Swap function
 * 
 * @param a      first index
 * @param b      second index
 * @param array  pointer to array with function pointers
 *
 */
void swap(const unsigned int a, const unsigned int b, cmd_t *array);

/* Initializes the array with function pointers
 * 
 * @param array  pointer to array with function pointers
 *
 */
void init(cmd_t *array);

/* Does one calculation step according to command
 * 
 * @param command  command to execute
 * @param array    pointer to array with function pointers
 *
 */
void calculate(const unsigned int command,const cmd_t *array);

