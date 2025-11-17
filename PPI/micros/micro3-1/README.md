# Mikroübung 3-1
Schreiben Sie ein Programm, welches vier Zeilen mit jeweils zwei Ganzzahlen von der Standardeingabe liest. 
Alle Zeilen haben das folgende Format (a und b sind Ganzzahlen):

```bash
a b
```
Mit jedem gelesenen Zahlenpaar soll nun eine bestimmte Rechenoperation ausgeführt werden.

1. Addition, Wertebereiche: $a \in \left[0, 2^{13}\right]$, $b \in \left[-2^{15}, 2^{13}\right]$
2. Subtraktion, Wertebereiche: $a \in \left[-2^{14}, 2^{13}\right]$, $b \in \left[-2^{14}, 2^{14}\right]$
3. Multiplikation, Wertebereiche: $a \in \left[0, 2^{31}\right]$, $b \in \left[0, 2^{31}\right]$
4. Berechnen Sie den Restwert der Division $a / b$, Wertebereiche:
$a \in \left[-2^{15}, 0\right]$, $b \in \left[1, 2^{14}\right]$

Verwenden Sie je nach Wertebereich der Zahlen einen passenden Datentyp. Jedes Ergebnis soll in einer eigenen Zeile ausgegeben werden. Der Rückgabewert (return) des Programms soll `0` sein. 

Beispiel:

|Input  |Output |
|-------|-------|
|`0 2`    |`2`      |
|`-3 6`   |`-9`     |
|`4 6`    |`24`     |
|`-9 2`   |`-1`     |



__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 

```bash
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen *Commit* und *pushen* diesen.
