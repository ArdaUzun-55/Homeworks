# Mikroübung 4-2
Schreiben Sie ein Programm, welches eine Zeichenkette unbekannter Länge von der Standardeingabe liest.
Die einzelnen Zeichen sind mit dem Caesar-Chiffre verschlüsselt und sollen entschlüsselt wieder ausgegeben werden.

Nehmen Sie dazu Folgendes an:
- Es werden nur darstellbare Zeichen aus dem ASCII-Zeichensatz verwendet
- Das Ende der Zeichenkette wird durch ein `newline`-Zeichen (`\n`) markiert. Dieses gehört *nicht* mit zur Zeichenkette.
- Die Verschlüsselung erfolgte mit:

    encrypt<sub> K </sub>(P) = 32 + mod(P + K - 32, 96)

    Wobei `K` (`unsigned int`) die Verschiebung des jeweiligen Zeichens P ist.

Die einzulesende Datei hat das folgende Format:

```bash
K
abc...
```

Das Ergebnis soll in einer einzelnen Zeile ausgegeben werden. 
Die Zeile endet mit einem `newline`-Zeichen.

Am Ende soll das Programm 0 zurückgeben. 

Beispiel:

|Input   |Output |
|--------|-------|
|3       |caesar |
|fdhvdu  |       |


__Hinweis:__
Nach jeder Änderung müssen Sie Ihr Programm neu mit dem Befehl `make` kompilieren. 
Mit 
```
./solution < sample.in | diff - sample.out
```
können Sie Ihre Änderungen lokal auf Ihrem PC überprüfen. Sobald die Änderungen den gewünschten Effekt erzielen, erstellen Sie einen `Commit` und `pushen` diesen.

__Zusatz:__
Entschlüsseln Sie mit ihrem Programm den Inhalt der Datei sample2.in :)

__Challenge :__
Schreiben Sie ein Programm, dass einen Text (Nur 1 Zeile!) wie angegeben
verschlüsselt und schicken Sie eine verschlüsselte Nachricht an ihren
Tutor. 
