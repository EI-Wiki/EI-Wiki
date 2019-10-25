# [EI-Wiki](..)/[Datastructuren](Home)/Opgave 2

## 0. Project aanmaken
In IntelliJ maak een nieuw project an gebruik als template (2de pagina) een 'Console Application'.

Nu kan je de bestanden toevoegen in je project. Dit kan door ze gewoon in  de prject folder te slepen in de bestands verkenner (file explorer).

Deze bestanden gaan een hoop errors throwen. Dit komt omdat ze niet in de zelfde package zitten als je main class. Je kan de projecten toeveoegen aan de package door de lijn bovenaan in je main class te kopieeren naar de andere klasses. Deze lijn ziet er ongeveer als volgt uit:
```vhdl
package com.company;
```

Het bestand `ListTest.java` moet niet togevoegd worden aan het project. Deze klasse is een unit test voor de LList klasse. Je kan hier wel inspiratie halen voor de opdrachten.

## 1. Maak een Linked List
In deze opgave is het de bedoeling om een simpele instantie te maken van het type `LList`. Zorg er ook voor dat deze lijst wordt geprint op de console of terminal.

## 2. Remove een element
Met de Linked List uit opdracht 1 ga je element 6 verwijderen en dan de list terug opnieuw te printen.

## 3. Aanpassen van de Linked List
### 3.1 Insert
De code die we gekregen hebben insert een element na de huidige positie (current position). Echter willen we dat dit op de plaats komt van de huidige node (current node). Hier zijn voorbeelden:

We hebben de linked list `<1 3>` met als current positie `0`. Dus als we een element (`2`) toevoegen hier krijgen we de linked list: `<1 2 3>`. We willen dat de list de volgende wordt: `<2 1 3>`.

Herschrijf hiervoor de code.

## 3.2 Remove
Nu moeten we de remove ook aanpassen zodat ze dezelfde functionaliteit heeft. Dus op positie `0` wordt het eerste element verwijderd etc.

## Conclusie
Schrijf je bevindingen in een pdf en lever deze samen met je code in.