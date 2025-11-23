# Mikroübung 5-1
Schreiben Sie ein Programm, welches `n` Ganzzahlen (int) von der Standardeingabe
liest und nach dem einlesen die `m` größten Zahlen, in absteigender Reihenfolge ausgibt. 

Die einzulesende Datei hat das folgende Format:

```bash
n
Zahl1
Zahl2
...
Zahln
m
```

Jedes Ergebnis soll in einer einzelnen Zeile, ohne Leerzeichen, ausgegeben werden. 
Am Ende soll das Programm 0 zurückgeben. 

Beispiel:

|Input   |Output |
|--------|-------|
| 6      | 11    |
| 1      | 8     |
| 4      |       |
| 8      |       |
| 2      |       |
| 3      |       |
| 11     |       |
| 2      |       |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

