# Mikroübung 7-1
Gegeben sei das Programm in `micro.c`, welches vorzeichenlose Ganzzahlen von der Standardeingabe liest und anschließend im Binärformat ausgibt.

Implementieren Sie die *rekursive* Funktion:

`dec2bin` welche die eingelesene Zahl im Binärformat ausgibt.

Jede Binärzahl steht in einer eigenen Zeile und ist so kurz wie möglich, wobei das Bit mit dem höchsten Stellenwert links steht; für alle von 0 verschiedenen Zahlen ist die führende (linke) Stelle somit eine 1.

Implementieren Sie die Funktion in der Datei `functions.c`. Übernehmen Sie den Funktionsprototyp (-kopf) aus der Datei `functions.h`, in der auch die Dokumentation der Funktion enthalten ist.

__Hinweis:__
- Die Datei `micro.c` und `function.h` darf *nicht* verändert werden.
- Die Aufgabe lässt sich mit Integerarithmetik und ohne Mathebilbiothek lösen; diese steht entsprechend nicht zur Verfügung.


Beispiel:

| Input            | Output          |
| ---------------- | --------------- |
| 2 <br> 17 <br> 8 | 10001 <br> 1000 |



__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

