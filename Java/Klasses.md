# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Klasses
## Klasse(class) structuur
Elke java klasses bevat de volgende structuur

De conventie is dat klasse namen in java altijd met een hoofdletter beginnen.

```java
class ClassName
{
    // Fields

    // Constructor(s)

    // Methods
}
```

## Modifiers
Modifiers veranderen de definities van fields, methods, classes en constructors.

### Access Control Modifiers
Deze modifiers bepalen de toegang tot fields, methods, classes en constructors.
De keywords `private`, `public` en `protected` worden hiervoor gebruikt.

**Private**: `private` zorgt ervoor dat men buiten de klasse niet aan de definitie kan.

**Public**: `public` zorgt ervoor dat je de definitie van overal kan bereiken.

**Protected**: `protected` zorgt ervoor dat enkel de package en subclasses aan de definitie kunnen.

**Geen access modifier**: Enkel leden van de package kunne de definitie bereiken.

### Non-access Modifiers

**Static**: De `static` modifier wordt gebruikt dat de definitie kan worden bereikt zonder dat de klasse geinitialseerd moet zijn.

**Final**: Het `final` keyword duidt dat een definitie gefinaliseerd is (of constant).

**Abstract**: `abstract` wordt gebruikt bij overerving (inheritance). De modifier zegt dat een bepaalde definitie in de child classes verder wordt gedefinieerd.

## Fields
Fields zijn een soort variablen die voor heel de klasse scope gedefinieerd zijn.
Ze hebben vaak de modifier `private`. 
In java is de eerste letter van een field nooit een hoofdletter. Echter is dit niet verplicht. Ook zal je vaak field namen zien beginnen met een `_`, dit duidt gewoon op het feit dat het veld private is.

## Methods
### Methods
Methods zijn functies die specifiek tot een bepaalde klasse horen. Ze kunnen dus enkel op geroepen worden in de context cand klasse waar ze toe behoren.

De conventie in java is dat de eerste letter van een method naam een kleine letter is. In andere talen kan dit soms verschillen (bv. C# gebruikt hoofdletters). Dit is natuurlijk compleet aan jou om te beslissen.

De structuur van een method ziet er als volgt uit:
```java
<modifiers> <returnType> methodName(<parameters>)
{
    // Code here
}
```
Het return type is enn type van de waarde die de method terug geeft. Dit kan natuurlijk ook niets zijn en dan gebruiken we het type `void`. Om een waarde te returnen gebruik je het keyword `return`.

Parameters zijn waarden die meegeven worden aan de method. Deze kan ook niets zijn, we laten de parameters dan leeg.  

**Voorbeeld methods:**:
```java
private void printHello()
{
    System.out.println("Hello World!");
}

public void printString(String str)
{
    System.out.println(str);
}

private int multiply(int a, int b)
{
    return a * b;
}
```

**Voorbeeld aanroeping**:
```java
classObj.printHello();
classObj.printString("Print me!");

int factorA = 1;
int factorB = 2;
int mult = classObj.multiply(factorA, factorB);
```

### Getters and Setters

Getters en stters zijn speciale methoden die waardes van fields veranderen of returnen.

**Setters** zijn methodes die waardes van fields zetten/veranderen, hun signatuur ziet er zo uit:
```java
public void setFieldName(<type> newValue)
{
    this._fieldName = newValue;
}
```

**Getters** zijn methodes die de waarde van een field returnen. Hun signatuur is:
```java
public <type> getFieldName()
{
    return this._fieldName;
}
```

### Method overloading

Method overloading is een techniek om met dezelfde methode naam met andere code uit te voeren. Om een method overload aan te maken heb je verschillende parameter types nodig. Natuurlijk gebruik je dit enkel als de twee(of meer) methods ongeveer dezelfde functionaliteit hebben.

Voorbeeld:

```java
public void method(int i)
{
    System.out.println(i);
}

public void method(String str)
{
    System.out.println(str);
}

public int method(int a, int b)
{
    return a  + b;
}
```

## Constructor
Een constructor (*/kənˈstrʌktə/ - [con'struc·tor]*) is een soort method (of methode) die de klasse initialiseerd. Hier krijgen de fields vaak een initiele waarde toegekent. De constructor kent geen return type omdat deze de klasse soort van returned.

Om een constructor aan te maken maak je een methode aan zonder return type en met dezelfde naam als de klasse.

```java
public class ClassName
{
    public ClassName()
    {
        // Constructor
    }
}
```

Een constructor kan net zoals bij methods overloaded worden. De constructoren moeten dan wel vershillende paramtertypes hebben.

```java
public class ClassName
{
    public ClassName()
    {
        // Constructor
    }

    public ClassName(int i)
    {
        // Constructor with parameter i
    }
}
```

### Creëeren van klassen
Om een klasse object te maken gebruik je de volgende structuur:

```java
ClassName classObject = new ClassName(<parameters>);
```

De parameters zijn deze van de constructor die je wilt gebruiken.

## Voorbeeld klasse:
```java
public class Student
{
    private String _name, _lastname;
    private int _age;
    private int _yearsStudied;
    private boolean _isGraduated;

    public Student(String name, String lastname, int age)
    {
        this._name = name;
        this._lastname = lastname;

        this._age = age;

        this._yearsStudied = 0;
        this._isGraduated = false;
    }

    public Student(String fullname, int age)
    {
        String[] names = fullname.split(' ');

        this._name = names[0];
        this._lastname = names[1];

        this._age = age;

        this._yearsStudied = 0;
        this._isGraduated = false;
    }

    public void study(int years)
    {
        this._yearsStudied += years

        if(this._yearsStudied >= 4)
            this._isGraduated = true;
    }


    // Setters

    public void setName(String name)
    {
        this._name = name;
    }

    public void setLastname(String lastname)
    {
        this._lastname = lastname;
    }

    public void setAge(int age)
    {
        this._age = age;
    }

    // Getters

    public String getName()
    {
        return this._name;
    }
    
    public String getLastname()
    {
        return this._lastname;
    }

    public int getAge()
    {
        return this._age;
    }
}
```