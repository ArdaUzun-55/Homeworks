#include <stdio.h>
#include <stdlib.h>
// Eigene Header
#include "fcn_sheet6.h"

int main(void)
{
    unsigned numEvents, numFriends;

    /* NOTE Die Allokation des Speichers für die Events
     * gehört eigentlich nach readData; allerdings fehlt
     * uns hierzu noch notwendiges Wissen */
    char eventNameBuf[MAX_EVENTS][MAX_STRLEN];
    char * events[MAX_EVENTS];
    for (unsigned i = 0; i < MAX_EVENTS; i++) {
        events[i] = eventNameBuf[i];
    }

    /* NOTE Die Allokation des Speichers für die Freunde
     * gehört eigentlich nach readData; allerdings fehlt
     * uns hierzu noch notwendiges Wissen */
    char friendNameBuf[MAX_FRIENDS][MAX_STRLEN];
    char * friends[MAX_FRIENDS];
    for (unsigned i = 0; i < MAX_FRIENDS; i++) {
        friends[i] = friendNameBuf[i];
    }

    /* NOTE Die folgenden beiden Arrays sind mit maximaler
     * Größe angelegt. Die Speicherallokation sollte besser
     * in readData() angesiedelt sein und die korrekte Grüße
     * nutzen; Sie werden es erraten haben: dazu fehlt uns
     * das notwendige Wissen */
    bool mat[MAX_FRIENDS * MAX_EVENTS];
    unsigned cnt[MAX_EVENTS];

    readData(&numEvents, events, &numFriends, friends, mat);
    countParticipants(numEvents, numFriends, mat, cnt);
    printData(numEvents, events, numFriends, friends, mat, cnt);

    return 0;
}
