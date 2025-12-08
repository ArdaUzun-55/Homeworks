#ifndef EVENTS_H
#define EVENTS_H

#include "drink_machine.h"

/**
 * function pointer (callback) to call functions of the drink machine
 * via events (see below)
 */
typedef bool (* cb_t)(drink_machine_t *);

/**
 * implementation of main menu in a structure. Holds a menu entry and
 * a callback for the drink machine (to invoke the corresponding action,
 * e.g., dm_fill().
 */
typedef struct {
  const char * text;  ///> menu entry text, pointer to null-terminated string
  const cb_t cb;      ///> function pointer to drink machine function
} event_t;

/**
 * Reads commands from stdin and returns the event that needs to be executed
 * for a given command
 *
 * @return pointer to selected event
*/
const event_t * event_chooseEvent(void);

#endif
