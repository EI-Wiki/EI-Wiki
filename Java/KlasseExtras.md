# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Klasse Extras
## Woord vooraf
Dit is een uitbereiding op de [Klasses](Klasses) pagina.

## Inheritance
Inheritance of overerving is een techniek in programmeren om functionaliteit over te erven van een andere klasse(parent) en deze te gaan uitbereiden of veranderen.

Om functionaliteit over te erven van een klasse gebruiken we het keyword `extends` in java.
```java
class Student extends Person
{
    ...
}
```

Nu kunnen we in de klasse `Student` alle methodes aanroepen die de parent klasse (`Person`) bezit. Hier zijn enkele voorbeelden:
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

## Abstract Methods
Een abstract method is een method van een parent class die nog geen functionaliteit bezit. Deze moet worden geimplementeerd worden in de child classes.

```java
class Person
{
    private int _age = 0;

    public abstract void age(int years);
}

class OldPerson extends Person
{
    @Override
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

class YoungPerson extends Person
{
    @Override
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