#ifndef FCN_SHEET7_H
#define FCN_SHEET7_H


/**
 * Im Terminal eingegebene Datensätze einlesen.
 * Erzeugung der Zuordnung der Distanzen zu den einzelnen Ständen.
 * @param n    Anzahl der Stände
 * @param dist Zuordnung der einzelnen Distanzen zu den Ständen (Array mit (MAX_PLACES + 1) * (MAX_PLACES + 1))
*/
void readMarket(unsigned * n, unsigned * dist);

/**
 * Finden des kürzesten Wegs
 * @param n    Anzahl der Stände
 * @param dist Zuordnung der einzelnen Distanzen zu den Ständen (Array mit (MAX_PLACES + 1) * (MAX_PLACES + 1))
 * @return     Gesamtlänge des kürzesten Weges
*/
unsigned findRoute(unsigned n, const unsigned * dist);

#endif
