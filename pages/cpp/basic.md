<!--
Decl & Def (5, 24?): OK
Pointers (6-7, 18):
References (8-9):
Variables and scope (12): /
User defined types (13): /
STL (14): OK
    Iterators (57-59):
    Algorithms (60): /
Expressions (15):
    Operators (16-17):
    Conversion (19-20):
Statements (21-22):
Iterations (23):
Functions
    Static vars (25-26):
    Argument passing (27-29):
    Value return (30-31):
    Ref to functions (32): /
    Overloading (33): 
Namespaces (34-40): ~
Classes (41-56):
-->

# Basic Concepts

## STL - The Standard Library

In C++ zijn er al een hoop tools gemaakt om te gebruiken zonder dat je deze zelf moet coderen. Deze staan al standaard in de compiler <!--???--> en kunnen dus gewoon gebruikt worden. Hieronder een aantal handige tools:
* Containers zoals *vector*, *string*, *stack*, *queue*, *list*, *...*
* Iteratoren
* Algortimes om te sorteren, vergelijken, zoeken, ...

Om deze tools te kunnen gebruiken moet je steeds `std::tool` (std::string, std::stack) gebruiken. Je kan ook gebruik maken van [namespaces](#namespaces) om dit niet te moeten doen.

## Namespaces

<!--Ik snap niet goed wat het nut is van namespaces vs klasses-->

Namespaces kunnen gebruikt worden om logische groepen te maken. Ze kunnen als volgt gedefinieerd worden:

```cpp
namespace namespaceName {

}
```

[//]: # (TODO)

## Pointers en references

## Klasses

## Declaraties en definities

In C++ wordt er met twee soorten bestanden gewerkt de .h (header) en de .cpp (code) bestanden.
* In de .h bestanden wordt je klasse **gedeclareerd**, dwz elke variable en methode wordt opgelijst maar alleen met info over wat hun input en output is niet wat er gebeurt.
* In de .cpp bestanden worden deze variabelen en methoden **gedefinieerd**. Hier wordt de werking van elke methode bestchreven.

Om deze declaratie in je code te krijgen, moet je de header bestanden includen in je bestand. Dit kan op twee manieren.
```cpp
//Hier staat de header in de standaard header map, meestal enkel gebruikt met libraries
#include <[header]>

//Hier staat de header in de projectmap, wordt meestal gebruikt bij zelfgemaakte headers.
#include "[header].h"
```

### Voorbeeld

Header file (file.h)

```cpp
//Check of de header al eens gedefinieerd is
#ifndef PROJECT_FILE_H
#define PROJECT_FILE_H

#include <iostream>
using namespace std;

class Test {
public:
    Test();             //Constructor
    void setNum(int);   //De naam van de variabelen hoeft niet gegeven te worden in de header file, enkel het type
    int getNum();
private:
    int num;
}

#endif
```

Code file (file.cpp)
```cpp
#include "file.h"
//Er hoeven geen adere libraries included worden omdat deze al in de header gedefinieerd zijn.

Test::Test() {
    num = 0;
}

void Test::setNum(int newNum) {
    num = newNum;
}

int Test::getNum() {
    return num;
}
```

