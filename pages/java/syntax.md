# Syntax

## Code syntax
Java heeft een specifieke manier van code schrijven. In vergelijking met Python, moet je na elke lijn van code een `;` schrijven. Dit doe je om een lijn van code te beëindigen. Als je dit niet doet, zullen de meeste IDE's daar een error geven.
```java
System.out.println("Hello World!");
```

Zoals in alle andere programmeertalen moet je alle haakjes die je open doet uiteindelijk ook terug sluiten. De functie van de haakjes is zoals bij wiskunde. Instructies die in de haakjes zullen eerder uitgewerkt worden dan instructies buiten de haakjes.
```java
int age = (
            25 - 5
                + 10 
                    );

```

### Methods
Methods zijn functies die je kan aanroepen, stel je moet verschillende keren dezelfde stukjes code uitvoeren, dan kan je daar een method voor maken.
Methods hebben vaak ook een access modifier, meer info vind je hierover in [Klasses](Klasses#access-control-modifiers).

```java 
public String toString()
{
    ....
}

```

#### Method parameters
Als je methode afhankelijk is van een bepaalde waarde kan je die meegeven. Deze waardes noemen we parameters. Het is ook mogelijk om meerdere parameters mee te geven.

```java
// Parameter 1: name met type String
// Parameter 2: age met type int
private void printInfo(String name, int age)
{
    ...
}

```

#### Method returns
Methods kunnen ook waardes teruggeven, om dit te doen hebben we 2 dingen nodig een return type en een return statement.

Een return type is het type dat de method zal returnen of teruggeven deze is verplicht, ook als er geen waardes moeten worden teruggegeven worden. We duiden dit aan met het keyword `void`.

De return statement is een operatie die een waarde teruggeeft, deze stopt de method en geeft een waarde terug. Deze is verplicht met de enigste uitzondering als het return type `void` zou zijn.

Hier zijn enkele voorbeelden:


```java
// Method met return type String
public String getName()
{
    // Return een string
    return "Johannes";
}

// Method met return type void, zal dus niets returnen
public void read()
{
    // Je leest de EI-Wiki
    eiwiki.read();
    
    // Je stopt hier met lezen
    return;

    // Je zal nooit het dik boek lezen
    dikboek.read();
}

// Method met return type void, zal dus niets returnen
public void study()
{
    for(Vak vak : vakken)
    {
        vak.study();
    }

    // De methode stopt hier ookal is er geen return statement
}

```

## Conditions
### if statement
De `if` statement wordt gebruikt om te kijken of een conditie waar(true) is. Als je wilt kijken of iemand ouder is dan 16 jaar, doe dan dit. Kan je dat met een if statement doen.
```java
if (age > 16)
{
    // Runt als age > 16
    ...
}
```

Als je ook iets wilt doen als de statement niet waar is of vals(false), voor dezelfde conditie gebruik je `else`. Als de persoon dus niet ouder is dan 16 jaar, doe dan dit.

```java
if (age > 16)
{
    // Runt als age > 16
    ...
} 
else
{
    // Runt als age < 16
    ...
}
```

Als de vorige conditie vals is en je nog een andere conditie wilt nakijken gebruik je een `else if`.

```java
if (age > 16)
{
    // Runt als age > 16
    ...
}
else if (age > 8)
{
    // Runt als age < 16 en age > 8
    ...
}
else
{
    // Runt als age < 8
    ...
}
```

#### Een valse conditie nakijken
Als je een conditie wilt nakijken gaan we geen lege if statement schrijven gevolgd door een else. Je kan een conditie negeren (een NOT poort) door er een `!` voor te plaatsen.

```java
if(!conditie)
{
    // Runt enkel als de conditie vals(false) is.
}
```

### Switch statement
Als je een veriabele hebt die meerdere waardes kan aannemen en je wilt voor elke mogelijke waarde iets verschillend doen, kan je gebruik maken van een `switch` statement. Als je nu wilt kijken of een persoon 8, 12, 16 of 21 jaar oud is en iets wilt doen bij elk van deze mogelijke waardes, hoef je geen lange if-else blok meer te maken. Dit kan je nu doen met een switch statement.

Het kan gebeuren dat een switch statement geen case aanwezig is voor de gevraagde waarde, om deze gevallen op te vangen gebruiken we `default` ipv `case`.

```java
switch (age)
{
    case 8:
        // age == 8
        ...
        break;
    case 12:
        // age == 12
        ....
        break;
    case 16:
        // age == 16
        ...
        break;
    case 21:
        // age == 21
        ...
        break;
    default:
        // age != 8, 12, 16 of 21
        ...
        break;
}
```

Als je meerdere condities in 1 case statement wilt plaatsen (om bijvoorbeeld duplicate code te vermijden), kan je dit doen als volgt:

```java
switch (age)
{
    case 8:
        // age == 8
        ...
        break;
    case 12:
        // age == 12
        ....
        break;
    case 16:
        // age == 16
        ...
        break;
    case 21: case 22:
        // age == 21 || age == 22
        ...
        break;
    default:
        // age != 8, 12, 16, 21 of 22
        ...
        break;
}
```

## Loops 
### For loop
Een `for` loop kan op verschillende manieren gebruikt worden:
- als een loop die een beperkt aantal keren instructies uitvoert. (normal use)
- als een loop die voor elke waarde van een array instructies uitvoert. (foreach loop)

```java
// Loopt 10 keer
for (int i = 0; i < 10; i++)
{
    ...
}
```

```java
// Loopt voor elke waarde van de array intArray
for (int i : intArray)
{
    ...
}
```

### While loop
Een `while` loop is een loop die blijft loopen totdat de voorwaarde `false` of `0` is. De while lus kijkt eerst of de conditie al niet vals(false) is voor ze begint te loopen.

```java
while (i < 10)
{
    ...
}
```

De while loop heeft ook een speciale versie, de Do-While loop, deze loop voert eerst de instructies uit en dan kijkt dan pas of de voorwaarde nog steeds klopt. Hiermee kan je ook een `Iterator` maken

```java
do
{
    ...
} while (i < 10);
```

## Jump statements
### Break
Als je een loop geforceerd wilt doen laten eindigen gebruik je de jump statement `break`. Code na een break statement wordt zoals bij return niet meer uitgevoerd.

```java
// Oneindige lus
while(true)
{
    ...

    // De lus eindigt hier ongeacht de conditie
    break;
    
    // Code hierna wordt niet meer uitgevoerd
}
```

Je kan ook direct naar de volgende iteratie van een loop gaan, dit doe je met de jumpt statement `continue`. Hier stopt de loop niet, maar gaat direct over naar de volgende iteratie.

```java
int ch;
while (ch == getChar())
{
    ...

    if (ch == ' ')
    {
        // Ga naar de volgende iteratie
        continue;
    }

    ...
}
```

## Comments
Comments of comentaar zijn stukken tekst die niet worden gecompiled of gelezen door de computer. Ze dienen om extra uitleg te geven aan de mensen die de code schrijven.

Om comentaar in je code te plaatsen kan je gebruik maken van `//` (voor 1 enkele lijn van comentaar). Je zal dit al wel eerder hebben opgemerkt in de gegeven voorbeeldjes.

```java
// Dit is een enkele lijn comentaar
this.code = actualCode;
```

Indien je meerdere lijnen commentaar wilt hebben kan je een block comment maken. In bepaalde IDE's heb je een shortcut op de geselecteerde lijnen om te zetten naar een block comment (In IntelliJ IDEA is het ``Ctrl + Shift + /``). Het begin van een block comment begint met ``/*`` en het eindigt met ``*/``, alle lijnen die er tussen staan zullen als commentaar gezien worden. 

```java 
/* Dit is een block comment
 * Dit is nog steeds een deel van de block comment
 Dit ook nog de '*' wordt enkel gebruikt voor esthetische redenen
 */
 this.code = actualCode;
```

### JavaDoc
JavaDoc is ook een soort commentaar. JavaDoc wordt alleen in het begin van een method/class gebruikt en geeft dan een uitleg over deze method/class en zijn parameters. 

```java 
/** This is a JavaDoc comment
 * @param i parameter voor de method
 */
 public void code(int i){...}
```

JavaDoc wordt meestal ook online gezet, hierdoor kan men makkelijk begrijpen wat de code doet zonder naar de source code te gaan kijken.
In JavaDoc zijn er heel wat elementen die je kan gebruiken, je zult ze nooit allemaal moeten gebruiken, maar hier zijn ze:
- `@author`: Programmeur/Auteur van de code.
- `@deprecated`: Als de methode veroudert is en niet meer gebruikt wordt.
- `@exception`: Het type van een mogelijke error/exception die de methode throwed 
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
public class Person
{
    
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
public static void main()
{
    ...
}
```

Nadat je deze method er in hebt staan moet je de code nog exporteren, hierdoor krijg je 1 file die de file extensie `.jar` heeft.

Wil je nu je programma uitvoeren, dan doe je je console of terminal open en geef je het commando:
`java -jar <path/to/file>.jar`