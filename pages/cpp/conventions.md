# Coding conventions

Om je code overzichtelijk te houden, zijn er naamgeving afspraken. Hieronder worden de belangrijkste voor C++ opgenoemd.
(Hou ook rekening met het feit dat de compiler hoofdletter gevoelig / case-sensitieve is! )

## Taal

Gebruik Nederlands of Engels voor variabelen en functies. Blijf bij die ene taal, begin niet te mixen.

## Variablen

Variabelen in C++ worden in lowerCamelCase geschreven, dwz de eerste letter is een kleine letter en ipv een spatie maak je de eerste letter van het volgend woord een hoofdletter.

```cpp
int aantalLetters;
string naamStudent;
```

## Constanten

Constante waarden worden in full caps geschreven met een underscore ( _ ) ipv een spatie.

```cpp
const int LOOPS = 3;
const float PI = 3.14;
```

## Methoden

Functies worden in lowerCamelCase geschreven. Als je een mutatormethode schrijft gebruik dan zeker de **'set'** prefix. Bij een accessormethode gebruik je de **'get'** prefix. Methoden die een boolean returnen hebben meestal **'is'** als prefix.

```cpp
string getName() {
    return name;
}

void setScore(int newScore) {
    score = newScore;
}

int meanDistance() {
    ...
}
```

## Klassen

Klassen worden in UpperCamelCase geschreven.

```cpp
class Voertuig {
    ...
}

int main() {
    Voertuig voertuig;
}
```