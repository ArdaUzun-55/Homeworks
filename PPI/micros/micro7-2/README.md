# Mikroübung 7-2
Gegeben sei das Programm in `micro.c`, welches eine Zeichenkette von der Standardeingabe liest und anschließend alle Permutationen dieser Zeichenkette ausgibt.

Implementieren Sie die Funktion:

`perm` welche *alle* Permutationen der eingelesenen Zeichenkette ausgibt. 

Sie können folgende Annahmen treffen:
- In der Zeichenkette trifft kein Buchstabe doppelt auf
- Die Reihenfolge, in der die Permutationen ausgegeben werden, ist beliebig (zum Überprüfen auf Richtigkeit verwenden Sie bitte den unten angegebenen Befehl)

Implementieren Sie die Funktion in der Datei `functions.c`. Übernehmen Sie den Funktionsprototyp (-kopf) aus der Datei `functions.h`, in der auch die Dokumentation der Funktion enthalten ist. Sofern erforderlich, implementieren Sie weitere Funktionen in `functions.c`.

__Hinweis:__
Die Dateien `micro.c` und `function.h` darf *nicht* verändert werden.


Beispiel:

| Input | Output                                            |
| ----- | ------------------------------------------------- |
| abc   | abc <br> acb <br> bac <br> bca <br> cab  <br> cba |




__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | sort | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

