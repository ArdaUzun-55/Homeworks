#include "fcn_sheet7.h"
#include <stdbool.h>
#include <stdio.h>
#include <limits.h>
#define MAX_PLACES 10

unsigned findRouteCalc(unsigned current, unsigned visited_count, unsigned current_dist);

void readMarket(unsigned * n, unsigned * dist) {
   unsigned M;
   unsigned Ortx, Orty, Abstand;
   scanf("%u %u",n, &M);
   for(unsigned i = 0; i < ((MAX_PLACES+1)*(MAX_PLACES+1)); i++)
   {
        dist[i] = UINT_MAX;
   }
   for (unsigned i = 0; i <= MAX_PLACES; i++) {
        dist[i * (MAX_PLACES + 1) + i] = 0;
   }
   for(unsigned i = 0; i < M; i++)
   {
      scanf("%u %u %u",&Ortx, &Orty, &Abstand);
      dist[Ortx * (MAX_PLACES+1) + Orty] = Abstand;
      dist[Orty * (MAX_PLACES+1) + Ortx] = Abstand;
   }

}

unsigned findRoute(unsigned n, const unsigned * dist) {
   bool visited[MAX_PLACES + 1] = {false};
   unsigned findRouteCalc(unsigned current, unsigned visited_count, unsigned current_dist) {
      if (visited_count == n) {
        // Jetzt zurück zum Start (0)
        unsigned back_distance = dist[current * 11 + 0];
        
        // Prüfen ob Weg zurück existiert
        if (back_distance == UINT_MAX) {
            return UINT_MAX;  // Kein Rückweg → unmöglich
        }
        
        // Gesamtdistanz zurückgeben
        return current_dist + back_distance;
    }
    unsigned best = UINT_MAX;  
    for(unsigned i = 1; i <= n; i++)
    {
       if(!visited[i])
       {
        unsigned d = dist[current * 11 + i];
        if (d != UINT_MAX)
         {
              visited[i] = true;
              unsigned result = findRouteCalc(current,visited_count + 1, current_dist + d);
              if(result < best)
              {
                best = result;
              }            
              visited[i] = false;
        }

       }
    }
    return best;
    }
   return findRouteCalc(0,0,0);
   
}
