# Basic Concepts

## STL - The Standard Library

In C++ zijn er al een hoop tools gemaakt om te gebruiken zonder dat je deze zelf moet coderen. Deze staan al standaard in de compiler en kunnen dus gewoon gebruikt worden. Hieronder een aantal handige tools:
* Containers zoals *vector*, *string*, *stack*, *queue*, *list*, *...*
* Iteratoren
* Algortimes om te sorteren, vergelijken, zoeken, ...

Om deze tools te kunnen gebruiken moet je steeds `std::tool` (std::string, std::stack) gebruiken. Je kan ook gebruik maken van [namespaces](#namespaces) om dit niet te moeten doen.

## Casting
In C++ mogen we niet meer de standaard typecast maken (toch zeker in het vak 4-Geavanceerde Programmeertechnieken). We gebruiken de volgende casts in de plaats:

* `const_cast<Type>(expression)`: Veranderd het type van een expressie naar het hetzelfde type maar verwijderd of voegt de const flag toe.
* `dynamic_cast<Type>(expression)`: Veranderd het type van een expressie naar het gevraagde type.
* `static_cast<Type>(expression)`: Veranderd het type van een expressie naar het gevraagde type. (Verschil met dynamic is dat er geen runtime check wordt gemaakt)
* `reinterpret_cast<Type>(expression)`: Veranderd het type van een pointer naar dat van een andere pointer. Dit verzekerd enkel als je een expressie 2 keer reinterpret_cast (terug naar het zelfde type) dat je de zelfde waarde terugkrijgt.

Voorbeeld deling van 2 int's.
```cpp
int a = 1;
int b = 2;

double divide = a / static_cast<double>(b);
```

## Namespaces

Namespaces kunnen gebruikt worden om logische groepen te maken. Ze worden vaak gebruikt om klasses in een groep te verzamelen. Bijvoorbeeld als je een game zou ontwikkeling ga je alles dat met audio verzamelen in een audio namespace etc.

Namespaces worden als volgt gedefinieerd:

```cpp
namespace namespaceName {

}
```

## Pointers en references
### Pointers
Pointers zijn variabelen die wijzen naar een geheugenplaats van een object.

Om een pointer te definiëren voor een bepaald type gebruiken we de typenaam gevolgd door een `*`, bv. `int*` of `char*`.

Als we de pointer van een variabele willen krijgen, zet je een `&` voor de variabele naam.

```cpp
int a = 500;

// Dit is de pointer van a
int* aPtr = &a;
```

Als we de waarde van het geheugen element willen krijgen zetten we een `*` voor de pointernaam:

```cpp
int a = 500;

// Dit is de pointer van a
int* aPtr = &a;

// Dit print de waarde van a
std::cout << *aPtr;
```

### References
Een reference is een alias voor een bestaande variabele. Ze worden vaak verward met pointers, maar er zijn echter 3 grote verschillen:
* Je kan geen NULL reference (een reference die naar niets wijst) hebben.
* Je kan een reference niet naar een object verwijzen als het al is geïnitialiseerd is.
* Een reference moet geïnitialiseerd worden als het gecreerd wordt.

```cpp
int a;
int& r = a;

a = 5;

// Output: '5=5'
cout << a << "=" << r;
```

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

public:                         //Hier staan alle velden en functies die 'public' zijn
    KlasseNaam();               //De constructor (bijna altijd public)
    Klassenaam(int initNum);    //Meerdere constructors zijn mogelijk
    int getNum();
    virtual ~KlasseNaam();      //Dit is de destructor
protected:                      //Hier staan alle velden en functies die 'protected' zijn
    void setNum(int newNum);
private:                        //Hier staan alle velden en functies die 'private' zijn (meestal staan alle velden hier en worden getters en setters gebruikt om ze te krijgen/aan te passen)
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

Gebruik:
```cpp
KlasseNaam a{};                         //Expliciete call naar de standaard constructor

KlasseNaam b{5};                        //Expliciete call naar een andere constructor

KlasseNaam c;                           //Impliciete call naar de standaard constructor

KlasseNaam* d = new KlasseNaam(5);      //Expliciete call naar een andere constructor

KlasseNaam* arr = new KlasseNaam[10];   //Impliciete call voor elk van de elementen
```

#### Destructor

Een destructor wordt gebruikt om geïnitialiseerde velden te deinitialiseren. Dit betekend alle geheugen vrijmaken dat nog niet is vrijgemaakt.

We moeten dit doen omdat C++ geen garbage collection heeft en gebruikt geheugen niet automatisch wordt verwijderd als het buiten gebruik valt zoals bij andere talen zoals java.

Een destructor is best altijd virtual. Dit doen we omdat als we met overerving en polymorfisme gaan werken er hogere klasses zijn die meer geheugen gaan gebruiken dan de base klasse. Deze moet dan vrijgemaakt worden, maar als we virtual vergeten zijn in een base klasse gaat de compiler de destructor van de base klasse oproepen ipv de hogere klasse. Hierdoor zal er geheugen niet vrij gemaakt worden.

### Overerving
Net zoals in andere object geörienteerde programmeertalen bevat C++ ook overerving.

Om een klasse te kunnen overerven gebruiken we volgende syntax:

```cpp
// Header file

class Test : <public|protected|private> TestBase
{
    ...
}
```

#### Access modes
* `public`: Alle overgeërfde public velden blijven public in de child class. Private en protected overgeërfde velden blijven hetzelfde
* `protected`: Alle overgeërfde public worden protected. Private en protected overgeërfde velden blijven hetzelfde
* `private`: Alle overgeërfde velden worden nu private in de child klasse.

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
## Bronnen
* [Casting Operators](https://docs.microsoft.com/en-us/cpp/cpp/casting-operators?view=vs-2019) - Microsoft Docs
* [Inheritance in C++](https://www.geeksforgeeks.org/inheritance-in-c/) - Geeks For Geeks
* [C++ References](https://www.tutorialspoint.com/cplusplus/cpp_references.htm) - Tutorials Point
