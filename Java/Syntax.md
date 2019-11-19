{% include head.html %}
# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Syntax

## Code syntax
Java heeft een specifieke manier van code schrijven. In vergelijking met Python, moet je na elke lijn van code een `;` schrijven. Dit doe je om een lijn van code te beëindigen. Als je dit niet doet, zullen de meeste IDE's daar een error geven.
```java
System.out.println("Hello World!");
```

Zoals in alle andere programmeertalen moet je alle haakjes die je open doet uiteindelijk ook terug sluiten. De functie van de haakjes is zoals bij wiskunde. Dingen in de haakjes zullen samengenomen/uitgewerkt worden.
```
int age = (
            25 - 5
                + 10 
                    );

```

### Methods
Methods zijn functies die je kan aanroepen, stel je moet verschillende keren dezelfde stukjes code uitvoeren, dan kan je daar een method voor maken. Afhankelijk van gebruik kunnen methodes `public`, `private` of `protected` zijn, meer info vind je terug in [Klasses](Klasses#methods).

```java 
public void toString(){
    ....
}

```

#### Methode parameters
Als je methode afhankelijk is van een bepaalde waarde kan je die meegeven. Dit noemen we parameters, je kan ook meerdere parameters meegeven.
```java
private void printInfo(String name, int age){
    ...
}

```

#### Methode returns
Je kan ook eem methode maken om een waarde te krijgen. Een methode kan maar 1 waarde terug geven. Maar omdat Java een Objectgeoriënteerd taal is kan je dus wel een object terug geven. (als er geen waarde wordt terug geven scrhijven we void)
```java
public String getName(){
    return .... ;
}

```

#### Voorbeeld

```java
public Integer calculate(int A, int B){
    return A+B;
}

```

## Conditions
### if statement
De `if` statement wordt gebruikt op te kijken of iets waar is. Als je wilt kijken of iemand ouder is dan 16 jaar, doe dan dit... Kan je dat met een if statement doen.
```java
if (age > 16) {
...
}
```

Als je ook iets wilt doen als de statement niet waar is, op die zelfde if statement gebruik je `else`. Als de persoon dus niet ouder is dan 16 jaar, doe dan dit...

```java
if (age > 16) {
...
} else {
...
}
```

Als je nog een check wilt doen van dezelfde if statement. Dan maak je gebruik van een `else if` statement.

```java
if (age > 16) {
...
} else if (age > 8){
...
}else {
...
}
```

### Switch statement
Als je een veriabele hebt die meerdere waardes heeft en je wilt voor elke waarde iets doen, kan je gebruik maken van een `switch` statement. Als je nu wilt kijken of een persoon 8 jaar, 12 jaar, 16, jaar, 21 jaar is en iets wilt doen bij elk van deze waardes. Je kan dit ook doen met een if statement en voor elke waarde een else if maken. 
Wat kan gebeuren in een switch statement is dat er geen juist antwoord is, om dit op te lossen heeft men een `default` mogelijkheid. hier kan je bijvoorbeeld zeggen dat er niks moet gebeuren.

```java
switch (age){
    case 8:
        ...
        break;
    case 12:
        ....
        break;
    case 16:
        ...
        break;
    case 21:
        ...
        break;
    default:
        ...
        break;
}
```

Als je meerdere condities in 1 case statement wilt plaatsen (om bijvoorbeeld duplicate code te vermijden), kan je dit doen als volgt:

```java
switch (age){
    case 8:
        ...
        break;
    case 12:
        ....
        break;
    case 16:
        ...
        break;
    case 21: case 22:
        ...
        break;
    default:
        ...
        break;
}
```

## Loops 
### For loop
Een ``for`` loop kan op verschillende manieren gebruikt worden:
- als een loop die een beperkt aantal keren iets doet. (normal use)
- als een loop die voor elke waarde iets te doet (for each loop)

```java
for (int i=0; i < 10; i++) {
...
}
```

```java
for (int i : intArray) {
...
}
```

### While loop
Een `while` loop is een loop die blijft loopen tot dat de voorwaarde `false` of `0` is. (De voorwaarde wordt eerst nagekeken voordat er iets wordt uitgevoerd)

```java
while (i < 10) {
...
}
```

De while loop heeft ook een speciale versie, `de Do-While` loop, deze loop doet eerst wat je wilt doen en dan kijkt hij pas of de voorwaarde nog steeds klopt. Hiermee kan je ook een `Iterator` maken

```java
do {
...
} while (i < 10);
```

## Jump statements
Als je in een loop of conditionele statement zit en je wilt de code beëindigen, kan je gebruik maken van een jump statement. Een goed voorbeeld is de switch statement, na elke `case` moet je de code breken door `break` te gebruiken. Dit kan ook gebruikt worden in andere loops als je een loop volledig wilt breken. Als je `break` gebruikt dan zal je loop of conditie niet meer verder gaan.
```java
for (int i = 0; i < 10; i++) {
    while (true) {
        break; //stopt de while lus
    }
    ...
}
```

Je kan ook een enkele iteratie van een loop overslaan door `continue` te gebruiken. Als je bijvoorbeeld kijkt of een lijst een lege entry heeft, kan je deze overslaan door `continue` te gebruiken.
```java
int ch;
while (ch == getChar()) {
    if (ch == ' ') {
        continue; // Skip de rest
    }
    ...
}
```

Als je in een methode zit en je wilt deze stoppen, kan je `return` gebruiken. Als de methode een waarde terug verwacht dan moet je een waarde terug geven (dit kan ook een null waarde zijn).
```java
void calculate(int A, int B) {
    // If streamClosed is true, execution is stopped
    if (A <0 || B<0) {
        return;
    }
    ...
}
```

## Comments
Om comentaar in je code te plaatsen kan je gebruik maken van `//` (voor 1 enkele lijn van comentaar).

```java
//This is a single comment line
this.code = actualCode;
```

Indien je meerdere lijnen commentaar wilt hebben kan je een block comment plaatsen. In bepaalde IDE's heb je een shortcut op de geselecteerde lijnen om te zetten naar een block comment (In IntelliJ IDEA is het ``Ctrl + Shift + /``). Het begin van een block comment begint met ``/*`` en het eindigt met ``*/``, alle lijnen die er tussen staan zullen als commentaar gezien worden. 

```java 
/* This is a block comment
 * this is still part of the block comment
 */
 this.code = actualCode;
```

### JavaDoc
JavaDoc is ook een soort commentaar. JavaDoc wordt alleen in het begin van een method gebruikt en geeft dan een uitleg over de method en zijn parameters. 

```java 
/** This is a JavaDoc comment
 * @param i parameter voor de method
 */
 public void code(int i){...}
```

JavaDoc wordt meestal ook online gezet, hierdoor kan men makkelijk begrijpen wat de code doet zonder naar de source code te gaan kijken.
In JavaDoc zijn er heel wat elementen die je er in kan gebruiken, je zult ze nooit allemaal moeten gebruiken, maar hier zijn ze:
- `@author`: Programmeur/Auteur van de code.
- `@deprecated`: Als de methode veroudert is en niet meer gebruikt wordt.
- `@exception`: <!--TODO-->
- `@param`: Definieert een parameter van een methode. Verplicht voor iedere parameter.
- `@return`: Definieert een teruggegeven waarde (niet verplicht bij het type `void`).
- `@returns`: Zelfde als `@return`.
- `@see`: Verwijst naar een andere method/klasse.
- `@since`: Geeft aan wanneer een methode is toegevoegd in de klasse.
- `@throws`: Zelfde als exception.
- `@version`: Versie van de methode of klasse.

```java
/**
 * This is an example code for JavaDoc
 *
 * @author Pierre Franck
 * @version 1.0
 */
public class Person {
 
...

/**
 * Person constructor
 * @param name
 * @param age
 */
public Person (String name, int age){...}

/**
 * Get the age of the person
 * @return integer, age of person
 * @since 0.1, 29/10/2019
 */
public Integer getAge(){...}
    ...
}
```

## Zelfstandig Java programma
Wil je nu je code kunnen uitvoeren zonder dat je jouw IDE moet gebruiken? Dan heb je een `Main method` nodig, deze bevind zich in je hoofd klasse. Ook in je main method kan je parameters of een return statement gebruiken (in het geval dat je programma een programma aanroept of werd aangeroepen door een ander programma).

In je main method maak je al je instances en objecten aan.

```java
public static void main(){
    ...
}
```

Nadat je deze method er in hebt staan moet je de code nog exporteren, hierdoor krijg je 1 file die de file extensie ``.jar`` heeft.

Wil je nu je programma uitvoeren, dan doe je je console of terminal open en geef je het commando:
``java -jar <path/jarname>.jar``

