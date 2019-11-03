{% include head.html %}
# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Klasse Extras
## Woord vooraf
Dit is een uitbreiding op de [Klasses](Klasses) pagina.

## Inheritance
Inheritance of overerving is een techniek in programmeren om functionaliteit over te erven van een andere klasse(parent) en deze te gaan uitbreiden of veranderen.

Om functionaliteit over te erven van een klasse gebruiken we het keyword `extends` in java.
```java
class Student extends Person
{
    ...
}
```

Nu kunnen we in de klasse `Student` alle methodes aanroepen die de parent klasse (`Person`) bezit. Dit gebeurt met het keyword `super`, dit duidt gewoon op de bovenliggende klasse (parent).

Als we dus de bovenliggende constructor willen gebruiken doen we dit zo:

```java
class Child extends Parent
{
    public Child(...)
    {
        super(...);
    }
}
```

En als we bovenliggende methods willen gebruiken doen we dit zo:

```java
class Child extends Parent
{
    public void Func(...)
    {
        super.Func(...);
    }
}
```

Hier is een voorbeeld van een volledige overerving:
```java
class Person
{
    private String _name;
    private int _age;

    public Person(String name, int age)
    {
        this._name = name;
        this._age = age;
    }

    public void rename(String name)
    {
        this._name = name;
    }

    public void age()
    {
        this._age++;
    }

}

class Student extends Person
{
    // Fields uit de super/parent class moeten
    //  niet nog is gedefinieerd worden!

    private String _studentId;
    private int _yearsStudied;

    public Student(String name, int age, int studentId)
    {
        // Gebruik de constructor van de klasse persoon
        super(name, age);

        // Doe eigen constructor functionaliteit
        this._studentId = studentId;
        this._yearsStudied = 0;
    }

    public void Study()
    {
        // Roep de method age aan van de parent class
        super.age();

        this._yearsStudied++;
    }

    // Age en Rename hoeven niet geimplementeerd worden
    //  omdat ze al in de super class zijn geimplementeerd!
}
```

## Abstract Classes
Abstract klasses zijn klasses zonder/met weinig functionaliteit. Ze worden gebruikt als parent bij overerving.

We kunnen ze gebruiken als we een functionaliteit die fundamenteel hetzelfde doet maat met verschillende types. 
Bijvoorbeeld in cryptographishe klasses. We kunnen enkel cryptografische functionaliteit schrijven met bytes.
We kunnen deze implementeren in de child classes. 
De functionaliteit om andere types over te zetten naar bytes schrijven we dan als functionaliteit in de abstract class, deze is toch altijd hetzelfde.

Een abstracte klasse wordt gemaakt als een normale klasse met een extra modifier `abstract`:
```java
public abstract class AbstractClass
{
    ...
} 
```

### Abstract Fields
Dit zijn fields die nog moeten worden geïmplementeerd als je de abstract class overerft. Ze bevatten geen waardes in de parent class.

```java
public abstract class AbstractClass
{
    private abstract int _abstractField;
}
```

### Abstract Methods
In een abstracte klasse kunnen we gewone methods implementeren, maar we kunnen ook speciale methods implementeren, namelijk abstract methods.

Abstract methods bevatten geen functionailiteit maar enkel een signatuur. Dit betekend modifiers, return type en parameters.

**Abstract methods kunnen enkel gedefinieerd worden in een abstract class!**

```java
public abstract class AbstractClass
{
    public abstract void AbstractMethod(int param1);
}
```

Om abstract methods te implementeren in je child class gebruik je volgende syntax:
```java
public abstract class Child extends Parent
{
    @Override
    public void AbstractMethod(...)
    {
        ...
    }
}
```

### Voorbeeld
<!--Voeg voorbeeld toe met abstract field-->
```java
public abstract class Person
{
    protected int _age = 0;

    public abstract void onAged();

    public void age(int years)
    {
        this._age += years;
        onAged();
    }
}

public class YoungPerson extends Person
{
    @Override
    public void onAged()
    {
        if(this._age <= 30)
            System.out.println("Parteey");
    }
}

public class OldPerson extends Person
{
    @Override
    public void onAged()
    {
        if(this._age >= 100)
            System.out.println("I Died");
    }
}

```

## Interfaces
Interfaces lijken zwaar op klasses die je kan overerven enkel zal een interface **nooit** functionaliteit of modifiers bezitten. Ze is een soort signatuur voor een familie van klasses.

Interface namen beginnen vaak met een `I` van interface.

De keywoord om een interface te implementeren is `implements`.

```java
interface IPerson
{
    int _age ;
    void age(int years);
}

class OldPerson implements IPerson
{
    private int _age = 0;

    public void age(int years)
    {
        if (this._age + years >= 100)
            die();
        else
            this._age += years;
    }

    public void die()
    {
        System.out.println("I died!");
    }
}

class YoungPerson implements IPerson
{
    private int _age = 0;

    public void age(int years)
    {
        if (this._age + years <= 25)
            party();
        
        this._age += years;
    }

    public void party()
    {
        System.out.println("PARTEEEEY!");
    }
}
```

## Enums
Enums zijn types die op voorhand gedefinieerde constate waardes heeft. Enums worden gedefinieerd met het keyword `enum`.
De waardes van een enum zijn meestal gewoon woorden, die in hoofdletters worden getypt (omdat het constanten zijn).

```java
public enum Day {MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY};
```

Om een enum waarde op te vragen, gebruik je de naam van de enum gevolgd door de waarde:

```java
Day day = Day.MONDAY;
```

Bij switches is het zeer simpel om enum waardes te vergelijken:
```java
public void printDay(Day day)
{
    switch(day)
    {
        case MONDAY:
            System.out.println("Mondays am i right :(");
            break;
        case SATURDAY: case SUNDAY:
            System.out.println("Weekend!");
            break;
        default:
            System.out.println("Not Monday nor Weekend");
            break;
    }
}
```
