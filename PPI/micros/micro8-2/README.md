# Mikroübung 8-2
Gegeben sei das Programm in `micro.c`, welches Zahlen von der Standardeingabe liest und auf Basis dieser Berechnungen durchführt.

Wie in Mikroübung 8-1 stehen die eingelesenen Zahlen für folgende Berechnung. 
 * `0`: Die nächsten beiden eingelesenen Zahlen sollen aufaddiert werden
 * `1`: Die nächsten beiden eingelesenen Zahlen sollen voneinander subtrahiert werden
 * `2`: Mit den nächsten beiden eingelesenen Zahlen soll die Berechnung $x^y$ erfolgen. Es gilt $y > 0$

Erstellen Sie die benötigten strukturierte Datentypen und Funktionen, so dass ihr Programm die gewünschte Ausgabe ergibt. Verwenden Sie zur Implementierung die vorgegebenen Dateien `functions.h` und `functions.c`.

__Hinweis:__
Die Datei `micro.c` darf *nicht* verändert werden.
Es darf keine zusätzliche Bibliothek verwendet werden.


Beispiel:

|Input    |Output |
|---------|-------|
|  3   <br> 0   <br> 1 1 <br> 1   <br> 2 1 <br> 2   <br> 2 3  | 2 <br> 1 <br> 8 |

__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

