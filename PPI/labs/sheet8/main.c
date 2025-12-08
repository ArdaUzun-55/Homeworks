#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include "drink_machine.h"
#include "events.h"


int main(int argn, const char * argv[])
{
  drink_machine_t dm;
  dm_init(&dm);

  dm_addIngredient(&dm, &(ingredient_t){ "beans", 0, 500 });
  dm_addIngredient(&dm, &(ingredient_t){ "chocolate", 0, 250 });
  dm_addIngredient(&dm, &(ingredient_t){ "tea", 0, 3 });
  dm_addIngredient(&dm, &(ingredient_t){ "water", 0, 1000 });
  dm_addIngredient(&dm, &(ingredient_t){ "milk", 0, 750 });

  dm_addDrink(&dm, &(drink_t){ "coffee", {40, 0, 0, 50, 0} });
  dm_addDrink(&dm, &(drink_t){ "latte macchiato", {40, 0, 0, 30, 20} });
  dm_addDrink(&dm, &(drink_t){ "espresso", {30, 0, 0, 10, 0 } });
  dm_addDrink(&dm, &(drink_t){ "hot chocolate", {0, 50, 0, 10, 30} });
  dm_addDrink(&dm, &(drink_t){ "tea", {0, 0, 1, 30, 0} });

  if (! dm_initFromParams(&dm, argn, argv) ) {
    return 1;
  }

  while (1) {
    const event_t * ev = event_chooseEvent();
    if (! ev->cb(&dm)) {
      break;
    }
  }

  return 0;
}

