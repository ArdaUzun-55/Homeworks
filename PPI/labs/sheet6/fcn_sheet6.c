// Includes
#include "fcn_sheet6.h"
#include <stdlib.h>


void bubbleSort(unsigned numEvents, char ** events)
{
  // abort, if pointer to events array is invalid (NULL)
  if (events == NULL) {
    return;
  }
  int rc;
  bool swapped;
  unsigned remN = numEvents - 1;
  do {
    swapped = false;
    for (unsigned i = 0; i < remN; i++) {
     rc = strcmp(events[i], events[i+1]);
      if (rc > 0) {
        // swap elements in array
        char * tmp = events[i];
        events[i] = events[i+1];
        events[i+1] = tmp;
        swapped = true;
      }
    }
    remN--;
  } while (swapped);
}

void readData(unsigned * numEvents, char ** events, unsigned * numFriends, char ** friends, bool * mat)
{
  char delimiter;
  char *pch [MAX_FRIENDS];
  char friendsline[MAX_FRIENDS][100];
  scanf("%u", numEvents);
  for (unsigned i = 0; i < *numEvents; i++)
  {
    scanf("%s", events[i]);
  }
  if (events == NULL) {
    return;
  }
  bubbleSort(*numEvents, events);
  scanf("%d %c", numFriends, &delimiter);
  getchar();
  for (unsigned i = 0; i < *numFriends; i++)
  {
    fgets(friendsline[i],100,stdin);
    friendsline[i][strcspn(friendsline[i], "\n")] = 0; // remove newline character
  
   
  }
  char *friendPtrs[MAX_FRIENDS];
for (unsigned i = 0; i < *numFriends; i++) {
    friendPtrs[i] = friendsline[i];
}
  bubbleSort(*numFriends, friendPtrs);
  for (unsigned i = 0; i <= *numFriends; i++) {
    for (unsigned j = 0; j < *numEvents; j++) {
        mat[i * *numEvents + j] = false;
    }
}
  for (unsigned i = 0; i < *numFriends; i++)
  {
    pch[i] = strtok (friendPtrs[i],&delimiter);
    if(pch[i] != NULL)
    {
    friends[i] = malloc(strlen(pch[i]) + 1);
    strcpy(friends[i], pch[i]);
    }
    while (pch[i] != NULL)
  {
    for(unsigned j = 0; j < *numEvents; j++)
    {
    if(strcmp(pch[i],events[j]) == 0)
    {
      mat[i * *numEvents + j] = true;
      break;
    }
    }
    pch[i] = strtok (NULL,&delimiter);

    
  }
  }
}

void countParticipants(unsigned numEvents, unsigned numFriends, const bool * mat, unsigned * cnt)
{
  for (unsigned i = 0; i < numEvents; i++)
  {
    cnt[i] = 0;
    for(unsigned j = 0; j < numFriends; j++)
    {
      if(mat[j * numEvents + i]  == true)
      {
        cnt[i]++;
      }
    }

  }
}


void printData(unsigned numEvents, char ** events, unsigned numFriends, char ** friends, bool * mat, unsigned * cnt)
{
  for(unsigned i = 0; i < numEvents; i++)
  {
  printf("%s - %u:", events[i], cnt[i]);
  for(unsigned j = 0; j < numFriends; j++)
  {
      if(mat[j * numEvents + i]  == true)
      {
        printf(" %s", friends[j]);
      }
    }
        printf("\n");
  }
  
}
