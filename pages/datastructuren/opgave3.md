# [Datastructuren](/datastructuren)/Opgave 3

## 0. Project aanmaken
In IntelliJ maak een nieuw project an gebruik als template (2de pagina) een 'Console Application'.

## 1. Wat is een stack?
Een stack is een soort array waar je enkel op het einde dingen kunt toevoegen of weg halen. 

Om dit te doen gebruiken we 2 methods `push` en `pop`. 

[Java documentatie: Stack](https://docs.oracle.com/javase/7/docs/api/java/util/Stack.html)

### 1.1 Push
`push` is de method om op het einde van de stack een nieuw element te pushen.

<img height="200px" src="/media/datastructuren/media/opgave3/push.png" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

### 1.2 Pop
`pop` is de method om een element van het einde van de stack te halen.

<img height="200px" src="/media/datastructuren/media/opgave3/pop.png" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

## 2. Parser

De bedoeling van de parser is dat we gaan controleren of alle haakjes (`()`, `[]` en `{}`) correct worden afgesloten.
We gaan dit doen d.m.v. een Stack. We doen dit door elk open haakje op de stack te pushen en als we het gesloten haakje tegen komen poppen we van de stack. 
We kijken of de gepopte open haakje overeen komt met het gesloten haakje dat we hebben ingelezen. Als dit niet zo is dan returned de parser `false`.

Op het einde van de parser kijken we of de stack leeg is en returnen `false` als dit niet zo is. 
Als alle checks goedgebeurt zijn returnen we `true`.