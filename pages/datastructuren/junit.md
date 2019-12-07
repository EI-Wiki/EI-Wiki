# [Datastructuren](/datastructuren)/JUnit
## Wat is JUnit?
Junit is een java framework dat helpt bij het opzetten van unit tests. Unit tests zijn tests die we op voorhand schrijven om te testen of onze software werk zoals het moet.

## JUnit importen
In IntelliJ voeg eerst een JUnit import toe. bijvoorbeeld:
```java
import org.junit.*;
```

Daarna druk je `alt + enter` en selecteer je 'Add JUnit 5.4 to classpath' je mag ook 4 kiezen.
Druk OK. Nu is JUnit geinstalleerd in je project.

## Test klassen
Om een test klasse te maken maak je een gewone klasse aan. In deze klasse plaats je dan testmethods maken. Dit zijn public methods met een attribute Test boven zich. Hier is een voorbeeld testklasse:
```java
import org.junit.Test;

public class TestClass
{
    @Test
    public void Test1()
    {
        // Do tests here
    }

    @Test
    public void Test2()
    {
        // Do tests here
    }
}
```

## Asserts
Assert methods kijken zoals if statements of een conditie klopt. Enkel als asserts een valse conditie meekrijgen stoppen ze de test en verklaren ze de hele test vals.

Er zijn verchillende assert methods hier zijn er een paar:

| Assert method | Argumenten | Functie |
|---|---|---|
| `assertEquals` | `expected`,`actual` | Kijkt of expected gelijk is aan actual. |
| `assertNotEquals` | `unexpected`,`actual` | Kijkt of unexpected niet gelijk is aan actual. |
| `assertArrayEquals` | `expecteds`,`actuals` | Kijkt of de array exprecteds gelijk is aan actuals. |
| `assertNull` | `object` | Kijkt of het meegegeven object null is. |
| `assertNotNull` | `object` | Kijkt of het meegegeven object niet null is. |
| `assertTrue` | `condition` | Kijkt of de meegegeven conditie waar is. |
| `assertFalse` | `condition` | Kijkt of de meegegeven conditie vals is. |


```java
import org.junit.Test;
import static org.junit.Assert.*;

public class TestClass
{
    @Test
    public void TestWithAsserts()
    {
        int a = 3 + 3;

        assertEquals(6, a);
        assertNotNull(a);
    }
}
```

## Run tests
Om je tests te runnen gebruik je volgende code:

```java
public void RunTests()
{
    Result result = JUnitCore.runClasses(TestClass.class);
}
```

Dit result object kan je nog een heleboel info door laten printen. Hier is bijvoorbeeld een voorbeeld die alle testdata afprint:

```java
public void RunTests()
{
    // Run the tests
    Result result = JUnitCore.runClasses(TestClass.class);

    // Print failures
    for (Failure failure : result.getFailures())
    {
        System.out.println(failure.toString());
    }

    // Print is the test run was a success
    if (result.wasSuccessful())
        System.out.println("All tests succeeded!");
    else
        System.out.println("Some tests failed!");
}
```