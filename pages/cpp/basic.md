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

Namespaces kunnen gebruikt worden om logische groepen te maken. Ze worden vaak gebruikt om klasses in een groep te verzamelen. Bijvoorbeeld als je een game zou ontwikkeling ga je alles dat met audio verzamelen in een audio namespace etc.

Namespaces worden als volgt gedefinieerd:

```cpp
namespace namespaceName {

}
```

[//]: # (TODO)

## Pointers en references

## Functies

## Klasses

C++ is een object georiënteerde taal en daarom is het maken van klasses een belangrijk onderdeel van de taal.

Net als bij andere object georiënteerde taken bestaat een klasse uit velden en functies. Een object is een instantie van een klasse.

Alle velden en functies hebben een bepaalde toegang die je bij het coderen van de klasse kan instellen. Er zijn drie niveaus:
* Public: objecten van elke klasse kunnen aan deze velden/functies
* Protected: enkel objecten van dezelfde klasse of subklassen
* Private: enkel objecten van dezelfde klasse

Als het niveau niet wordt gegeven, zal het automatich private gezet worden. Porbeer zo veel mogelijk te verstoppen om msbruik te voorkomen.

### Structuur

Een nieuwe klasse wordt als volgt gedefinieerd:

```cpp
class KlasseNaam {

public:                     //Hier staan alle velden en functies die 'public' zijn
    KlasseNaam();               //De constructor (bijna altijd public)
    Klassenaam(int initNum);    //Meerdere constructors zijn mogelijk
    int getNum();
    virtual ~KlasseNaam();      //Dit is de destructor
protected:                  //Hier staan alle velden en functies die 'protected' zijn
    void setNum(int newNum);
private:                    //Hier staan alle velden en functies die 'private' zijn (meestal staan alle velden hier en worden getters en setters gebruikt om ze te krijgen/aan te passen)
    int num;
}

KlasseNaam::KlasseNaam() {
    num = 0;
}

KlasseNaam::KlasseNaam(int initNum) {
    num = initNum;
}

KlasseNaam::getNum() {
    return num;
}

KlasseNaam::~KlasseNaam() {

}

KlasseNaam::setNum(int newNum) {
    num = newNum;
}
```

#### Constructor

De constructor wordt gebruikt om de velden te initialiseren bij het maken van een object. Er kunnen meerdere constructors zijn in één klasse, deze worden dan uiteen gehaald door de data die meegegeven wordt.

<!--
Is er een verschil tussen a{} en a = KlasseNaam()?
-->
Gebruik:
```cpp
KlasseNaam a{};                         //Expliciete call naar de standaard constructor

KlasseNaam b{5};                        //Expliciete call naar een andere constructor

KlasseNaam c;                           //Impliciete call naar de standaard constructor

KlasseNaam* d = new KlasseNaam(5);      //Expliciete call naar een andere constructor

KlasseNaam* arr = new KlasseNaam[10];   //Impliciete call voor elk van de elementen
```

[//]: # (TODO: slide 45,46)

#### Destructor

[//]: # (TODO)

## Declaraties en definities

In C++ wordt er met twee soorten bestanden gewerkt de .h (header) en de .cpp (code) bestanden.
* In de .h bestanden wordt je klasse **gedeclareerd**, dwz elke variable en functie wordt opgelijst maar alleen met info over wat hun input en output is niet wat er gebeurt.
* In de .cpp bestanden worden deze variabelen en functies **gedefinieerd**. Hier wordt de werking van elke functie bestchreven.

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

