#ifndef DRINK_MACHINE_H
#define DRINK_MACHINE_H

#include <stdbool.h>

#define INGREDIENT_NUM_MAX  5
#define DRINK_NUM_MAX       5


/**
 * ingredient for the drink machine, used for preparing drinks
 */
typedef struct {
  const char * name;  /**< name of the ingredient, pointer to
                           null-terminated string */
  unsigned curFill;   ///< current fill level, can be [0,maxFill]
  unsigned maxFill;   ///< maximum fill level
} ingredient_t;


/**
 * a drink prepared by the drink machine using given ingredients
 */
typedef struct {
  const char * name;  /**< name of the drink, pointer to
                           null-terminated string */
  unsigned ingredAmt[INGREDIENT_NUM_MAX];  /**< ingredients used for drink
                           preparation, must match order of ingredients in
                           the machine */
} drink_t;

/**
 * configuration of a drink machine
 */
typedef struct {
  unsigned      numDrinks;  /**< number of available drinks (items in
                           drinks[]), cannot exceed DRINK_NUM_MAX*/
  drink_t       drinks[DRINK_NUM_MAX]; /**< available drinks */
  unsigned      numIngredients;  /**< number of available ingredients
                           (items in ingredients[]), at most
                           INGREDIENT_NUM_MAX*/
  ingredient_t  ingredients[INGREDIENT_NUM_MAX]; /** available ingredients */
} drink_machine_t;


/**
 * Initialise drink machine
 *
 * @param dm   Pointer to struct that contains data of the machine 
 *
 * @return true, unless an invalid parameter is passed
 */
bool dm_init(drink_machine_t * dm);

/**
 * Adds a new drink type to the machine; the data pointed to by drink is
 * copied shallow.
 *
 * @param dm     Pointer to struct that contains data of the machine 
 * @param drink  Pointer to struct that contains data of the drink that is added 
 *
 * @return true, if the drink could be added; false otherwise
 */
bool dm_addDrink(drink_machine_t * dm, const drink_t * drink);

/**
 * Adds a new ingredient to the machine; the data pointed to by ingr is
 * copied shallow.
 *
 * @param dm     Pointer to struct that contains data of the machine 
 * @param ingr   Pointer to struct that contains data of the ingredient that is added
 *
 * @return true, if the ingredient could be added; false otherwise
 */
bool dm_addIngredient(drink_machine_t * dm, const ingredient_t * ingr);

/**
 * Function to handle fill mode of the machine (i.e., filling ingredients)
 * Asks which ingredient is refilled and refills accordingly upon user specificiation.
 *
 * @param dm     Pointer to struct that contains data of the machine
 * @return true
 */
bool dm_fill(drink_machine_t * dm);

/**
 * Function for prepare mode of the machine (i.e., prepare a drink).
 * Asks which drink should be prepared and checks that amount of necessary
 * ingredients is sufficient to prepare the drink. Upon successful preparation
 * of a drink, ingredients are consumed accordingly.
 * 
 * @param dm     Pointer to struct that contains data of the machine 
 * @return true
 */
bool dm_prepare(drink_machine_t * dm);

/**
 * Function for exit mode of the machine
 * Reports program exit and leads to program termination
 *
 * @param dm     Pointer to struct that contains data of the machine 
 * @return false
 */
bool dm_exit(drink_machine_t * dm);

/**
 * Function that initialises the machine's ingredients' fill level
 * with the given command line parameters
 *
 * @param dm     Pointer to struct that contains data of the machine 
 * @param argn   Number of given command line parameters
 * @param argv   Pointer to array with command line parameters
 *
 * @return true on success (exactly one value for each ingredient of the machine), false otherwise
 */
bool dm_initFromParams(drink_machine_t * dm, int argn, const char * argv[]);

#endif
