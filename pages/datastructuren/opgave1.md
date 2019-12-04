# /[Datastructuren](/datastructuren)/Opgave 1

## 0. Project aanmaken
In IntelliJ maak een nieuw project an gebruik als template (2de pagina) een 'Console Application'.

## 1. Bereken de Big O voor beide algoritmes
* Bereken de tijdscomplexiteit voor elke instructie

    <img height="200px" src="/media/datastructuren/media/opgave1/numalgo.png" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

* Daarna tel en vermenigvuldig je correct

    $$O_{1}\left(n\right)=1+n\cdot\left(1+n\cdot2+3\right)=2n^{2} + 4n + 1$$

## 2. Implementeer de pseudo code in java
* Arrays worden als volgt aangemaakt

```java
// Maak een nieuwe int array aan met lengte 'n'
int[] intArr = new int[n];
```
## 3. Creëer een random array generator.

```java
// Creëer een random object
Random rand = new Random();

// Genereer een eerste random getal
int r1 = rand.nextInt();

// Genereer een tweede random getal
int r2 = rand.nextInt();
```

## 4. Tijdsbepaling

* Bepaal de nodige tijd om het algoritme uit te voeren. Met één van de methodes `System.nanoTime()` of `System.currentTimeMillis()`. Gebruik hiervoor volgende formule: \\(\Delta t= t_1 - t_0\\).

* Bepaal de tijd voor \\(n\\). unieke arrays met een vaste lengte
* Bepaal de tijd voor \\(n\\) unieke arrays met een groeiende lengte
* Giet al je bekomen waardes in een excel bestand en voeg deze toe aan je portfolio of verslag (pdf document).
