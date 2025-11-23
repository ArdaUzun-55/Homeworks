# Mikroübung 5-3
Schreiben Sie ein Programm, welches die $`m`$-te Ableitung eines Polynom $`n`$-ten Grades mit den Koeffizienten $`a_i`$ an einer Stelle $`x`$ auswertet.

Das Polynom sei dabei definiert als:

```math
p(x) = \sum_{i=0}^{n} a_i \cdot x^i
```

mit der `m`-ten Ableitung ($`m > 0`$):

```math
p^{(m)}(x) = \sum_{i=m}^{n} a_i \cdot (i \cdot (i-1) \cdot ... \cdot (i-m+1)) \cdot x^{i-m}
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
m_0 x_0
m_1 x_1
...
m_{t-1} x_{t-1}
```

Geben Sie die Auswertungen $p^{(m_j)}(x_j)$ $`(0 \le j < t)`$ zeilenweise mit einer Genauigkeit von 3 Nachkommastellen aus.
Am Ende soll das Programm 0 zurückgeben. 

Beispiel:

|Input   |Output |
|--------|-------|
| 2      | 7.000 |
| 1      | 5.000 |
| 1      | 2.000 |
| 1      |       |
| 3      |       |
| 0 2    |       |
| 1 2    |       |
| 2 2    |       |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

