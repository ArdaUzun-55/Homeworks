#ifndef FCN_SHEET6_H
#define FCN_SHEET6_H

//Includes
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// Konstanten
#define MAX_STRLEN   21 // Maximale Länge verwendeter Zeichenketten
#define MAX_EVENTS   20 // Maximale Anzahl der Events
#define MAX_FRIENDS  10 // Maximale Anzahl der Freunde

// Funktionsprototypen

/**
 * readData(...): Einlesen der Datensätze
 * Im Terminal eingegebene Datensätze einlesen.
 * Extrahieren der jeweiligen Informationen, die durch ein Trennzeichen voneinander abgetrennt sind.
 * @param numEvents    Anzahl der Events
 * @param event        Bezeichnung der Events (Array von Zeigern auf je ein char[MAX_STRLEN])
 * @param numFriends   Anzahl der Freunde
 * @param friends      Bezeichnung der Freunde (Array von Zeigern auf je ein char[MAX_STRLEN])
 * @param mat          Zuordnung der Freunde zu den Events (Array mit numEvents*numFriends Elementen)
*/
void readData(unsigned * numEvents, char ** events, unsigned * numFriends, char ** friends, bool * mat);

/**
 * orgaEvent(...): Verarbeiten Informationen
 * Zählen der Teilnehmenden pro Event
 * @param numEvents    Anzahl der Events
 * @param numFriends   Anzahl der Freunde
 * @param mat          Zuordnung der Freunde zu den Events (Array mit numEvents*numFriends Elementen)
 * @param cnt          Teilnehmendenanzahl pro Event (Array mit numEvents Elementen)
*/
void countParticipants(unsigned numEvents, unsigned numFriends, const bool * mat, unsigned * cnt);

/**
 * printData(...): Ausgabe
 * Ausgabe der sortierten Teilnehmendenlisten
 * @param numEvents    Anzahl der Events
 * @param event        Bezeichnung der Events (Array von Zeigern auf je ein char[MAX_STRLEN])
 * @param numFriends   Anzahl der Freunde
 * @param friends      Bezeichnung der Freunde (Array von Zeigern auf je ein char[MAX_STRLEN])
 * @param mat          Zuordnung der Freunde zu den Events (Array mit numEvents*numFriends Elementen)
 * @param cnt          Teilnehmendenanzahl pro Event (Array mit numEvents Elementen)
*/
void printData(unsigned numEvents, char ** events, unsigned numFriends, char ** friends, bool * mat, unsigned * cnt);

#endif
