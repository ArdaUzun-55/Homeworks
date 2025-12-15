# Mikroübung 8-1
Gegeben sei das Programm in `micro.c`, welches Zahlen von der Standardeingabe liest und auf Basis dieser Berechnungen durchführt.

Implementieren Sie die Funktionen:

`init` welche das übergebene Funktionszeiger-Array initialisiert.

Das array `funcArray` soll mit folgenden Funktionen initialisiert werden:
  * `funcArray[0]`: Funktion welche zwei Ganzzahlen entgegennimmt, aufaddiert und dann ausgibt
  * `funcArray[1]`: Funktion welche zwei Ganzzahlen entgegennimmt, voneinander subtrahiert und dann ausgibt
  * `funcArray[2]`: Funktion welche zwei Ganzzahlen entgegennimmt und die Berechnung $x^y$ ausgibt. Es gilt $y \ge 0$

Die Funktion für `swap` soll zwei Elemente des übergebenen Arrays austauschen.

`calculate` führt das eingelesene Kommando (basierend auf einer Zahl) mittels der Funktionen enthalten in `array` aus

Implementieren Sie die Funktionen in der Datei `functions.c`. Übernehmen Sie die Funktionsprototypen (-köpfe) aus der Datei `functions.h`, in der auch die Dokumentation der Funktionen enthalten ist. Sofern erforderlich, implementieren Sie weitere Funktionen in `functions.c`.

__Hinweis:__
Die Dateien `micro.c` und `function.h` dürfen *nicht* verändert werden.
Es darf keine zusätzliche Bibliothek verwendet werden.


Beispiel:

|Input    |Output |
|---------|-------|
| 5   <br> 0   <br> 1 1 <br> 1   <br> 2 1 <br> 2   <br> 2 3 <br> 3   <br> 0 1 <br> 0   <br> 1 1 |  2 <br> 1 <br> 8 <br> 0 |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

