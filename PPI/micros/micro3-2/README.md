# Mikroübung 3-2
Schreiben Sie ein Programm, welches eine Zeile mit zwei Ganzzahlen (`int`) und einer
Gleitkommazahl (`float`) von der Standardeingabe liest.  Die einzulesende Zeile hat
folgendes Format:

```bash
a b c
```

Mit den eingelesenen Zahlen sollen nun folgende Berechnungen durchgeführt
und das Ergebnis ausgegeben werden.

1. $a / b + c$, Berechnung mit Präzision `int`
2. $a / b + c$, Berechnung mit Präzision `float`
3. $(a / b) / c$, Berechnung mit Präzision `float`

Jedes Ergebnis muss in einer einzelnen Zeile, ohne Leerzeichen, ausgegeben werden.  Es kann angenommen werden, dass Zahl2 und Zahl3 nie den Wert 0 haben. Gleitkommazahlen sollen mit **genau 3 Nachkommastellen** ausgegeben werden. Der Rückgabewert des Programmes soll `0` sein. 

Beispiel:

|Input   |Output |
|--------|-------|
|`4 2 2.0` | 4     |
|        | 4.000 |
|        | 1.000 |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 

```bash
./solution < sample.in | diff - sample.out
```

können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen *Commit* und *pushen* diesen.
