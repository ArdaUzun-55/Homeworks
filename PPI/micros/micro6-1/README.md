# Mikroübung 6-1
Gegeben sei das Programm in `micro.c`, welches Zahlen von der Standardeingabe liest, in einem Array speichert und dieses anschließend über Funktionen auswertet.

Implementieren Sie die Funktionen:

* `countOccurences` welche die Häufigkeit einer gesuchten Zahl in einem Array bestimmt und zurückgibt.

 * `countNumsAboveThreshold` welche die Anzahl der Zahlen, die größer sind als der Schwellwert (Threshold), bestimmt und zurückgibt.

 * `findFirstOccurence` welche die Adresse des Array-Elements zurückgibt, an der die gesuchte Zahl zuerst vorkommt. Falls die gesuchte Zahl nicht gefunden wird, soll die Adresse `NULL` zurückgegeben werden.

Implementieren Sie die Funktionen in der Datei `functions.c`. Übernehmen Sie die Funktionsprototypen (-köpfe) aus der Datei `functions.h`, in der auch die Dokumentation der Funktionen enthalten ist.

Hinweis:
Die Datei `micro.c` und `function.h` darf *nicht* verändert werden.


Beispiel:

| Input                                                            | Output          |
| ---------------------------------------------------------------- | --------------- |
| 8 <br> 1 <br> 2 <br> 3 <br> 4 <br> 5 <br> 6 <br> 7 <br> 8 <br> 4 | 1 <br> 4 <br> 3 |
 
__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

