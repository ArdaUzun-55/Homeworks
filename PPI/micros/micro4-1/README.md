# Mikroübung 4-1
Schreiben Sie ein Programm, welches drei Ganzzahlen (`int`) von der
Standardeingabe liest und die größte der drei Zahlen ausgibt. 
Nutzen Sie dazu nur die if-Anweisung als Kontrollstruktur. 
Die einzulesende Zeile hat das folgende Format:

```bash
Zahl1 Zahl2 Zahl3
```

Das Ergebnis soll in einer einzelnen Zeile, ohne Leerzeichen, ausgegeben werden. 

Am Ende soll das Programm 0 zurückgeben.

Beispiel:

|Input  |Output |
|-------|-------|
|1 3 2  |3      |



__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.
