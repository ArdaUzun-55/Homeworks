# Mikroübung 6-2
Gegeben sei das Programm in `micro.c`, welches Zeichenketten von der Standardeingabe liest, in einem Array speichert und diese anschließend über eine Funktion auswertet.

Implementieren Sie die Funktion:

* `findPalindromes` welche die Anzahl der eingelesenen \emph{Palindrome} bestimmt. Weiterhin soll die Funktion Zeiger zu den *verschiedenen* eingelesenen Palindromen, in deren auftretender Reihenfolge, in einem Array ablegen.

Ein Palindrom ist ein Wort, das sich vorwärts und rückwärts gleich lesen lässt. Bsp. "anna"
Es kann davon ausgegangen werden, dass ein Wort nur aus Kleinbuchstaben besteht.

Implementieren Sie die Funktion in der Datei `functions.c`. Übernehmen Sie die Funktionsprototypen (-köpfe) aus der Datei `functions.h`, in der auch die Dokumentation der Funktionen enthalten ist.

Hinweis:
Die Datei `micro.c` und `function.h` darf *nicht* verändert werden.


Beispiel:

| Input                                                       | Output                |
| ----------------------------------------------------------- | --------------------- |
| 5 <br> faaf <br> peter <br> johannes <br> anna <br> michael | 2 <br> faaf <br> anna |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

