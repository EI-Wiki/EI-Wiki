{% include head.html %}
# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Collections
## Arrays
### Definieren
Een array is een verzameling van elementen van het zelfde type. Zo kunnen we arrays maken van ints, strings en van eender welk type. 

Om een array te maken gebruiken we volgend formaat:
```java
<type>[] arr = new <type>[lengte];
<type>[] arr2 = new <type>[]{ elementen };
```

Hier zijn enkele voorbeelden:
```java
// Creerd een array met een lengte van 3 (3 elementen dus)
int[] intArr = new int[3];

// Creerd een array met 3 elementen
String[] strings = new String[] {"Hello", "World", "!!!"};
```

### Waardes setten/getten
Om een waarde uit een array te krijgen gebruiken we de naam van de array gevolgd door vierkante haakjes (`[]` of array tekens) met daar tussen de index van het gewilde element.

**Opgepast**: arrays starten in java vanaf 0.

```java
int[] intArr = new int[] {1, 2, 3, 4};

// Selecteer het tweede element uit de array.
int element1 = intArr[1];
```

Voor een waarde te veranderen in de array gebruiken we gelijkaardige syntax:
```java
int[] intArr = new int[] {1, 2, 3, 4};

// Het derde element wordt hier op 66 gezet.
intArr[2] = 66;
```

## ArrayLists

Een arraylist is vergelijkbaar met een array het is ook een collectie van een specifiek element. Het grootste verschil tussen de 2 is dat we bij de arraylist speciale methodes krijgen die sommige functionaliteit zeer makkelijk maken. Zoals het verwijderen van elementen of de lijst omdraaien.

Om een arraylist van het type `int` te definieeren gebruiken we volgende syntax:
```java
ArrayList<Integer> intList = new ArrayList<Integer>();
// Of Korter en aangeraden manier
ArrayList<Integer> intList = new ArrayList<>();
```
Om een element toe te voegen aan de list gebruik je de methode `add` en voor elementen te verwijderen gebruik je `remove`. We kunnen ook de  waarde opvragen van een bepaald element dit doen we met de `get` methode. Bijvoorbeeld:
```java
ArrayList<String> stringList = new ArrayList<>();

// Voeg een element toe
stringList.add("Test123");
stringList.add("Test456");

// Verwijder het element met index 0
stringList.remove(0);

// krijg de waarde van een element uit de lijst met index 0
System.out.println(stringList.get(0)); // Output = "Test456"
```

## Hashmaps

<!--TODO: Add hashmap uitleg-->