# Mikroübung 5-2
Schreiben Sie ein Programm, welches ein Polynom $`n`$-ten Grades mit den Koeffizienten $`a_i`$ an einer Stelle $`x`$ auswertet.

Das Polynom sei dabei definiert als:

```math
p(x) = \sum_{i=0}^{n} a_i \cdot x^i
```

Die einzulesende Datei hat das folgende Format:

```bash
n
a_0
a_1
.
.
.
a_n
t
x_0
x_1
...
x_{t-1}
```

Geben Sie die Auswertungen $p(x_j)$ $`(0 \le j < t)`$ zeilenweise mit einer Genauigkeit von 3 Nachkommastellen aus.
Am Ende soll das Programm 0 zurückgeben. 

Beispiel:

|Input   |Output  |
|--------|--------|
| 2      | 7.000  |
| 1      | 13.000 |
| 1      | 21.000 |
| 1      |        |
| 3      |        |
| 2      |        |
| 3      |        |
| 4      |        |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

