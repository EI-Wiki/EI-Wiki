# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Klasses
## Klasse structuur
Elke java klasses bevat de volgende structuur

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

### Getters and Setters

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

    public void Study(int years)
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