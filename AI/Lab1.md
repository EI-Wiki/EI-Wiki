# [EI-Wiki](..)/[AI](Home)/Lab 1 - Searching
## Introductie

Dit deel van de wiki gaat over de opdrachten van lab 1 (practicumsessies 1 & 2).

[Opgave](https://inst.eecs.berkeley.edu/~cs188/fa18/project1.html)

[//]: # (TODO: theorie)

We gaan proberen om een algoritme Pacman te laten spelen adhv zoekalgoritmes. **Pacman zal in dit lab nog geen rekeing houden met de ghosts, dat is voor latere sessies.**

Gelieve de opgaven steeds in volgorde uit te voeren, aangezien deze soms gebruikmaken van vorige opgaven.

## Commando's

Tijdens het testen zal je een aantal commando's moeten runnen, hier zie je wat de meestgebruikte opties betekenen.

Optie | Alternatief | Uitleg | Mogelijke waardes | Default
--- | --- | --- | --- | --
-h | --help | Geeft deze lijst | / | /
-n GAMES | --numGames GAMES | Hoeveel games gespeeld worden | >0 | 1
-l LAYOUT_FILE | --layout LAYOUT_FILE | Dit is welke map gebruikt wordt | De namen van alle bestanden in de *layouts* map | mediumClassic
-p TYPE | --pacman TYPE | Hiermee kies je de agent die pacman zal besturen | KeyboardAgent (zelf), SearchAgent (je programma) | KeyboardAgent
-t | --textGraphics | De output zal in ASCII getoond worden | / | / 
-q | --quietTextGraphics | De output zal minimaal zijn, zonder graphics | / | / 
-z ZOOM | --zoom ZOOM | Hoe hard het bord in- of uitgezoomd is, vooral gebruik bij grote borden | >0 | 1
-a AGENTARGS | --agentArgs AGENTARGS | Agrumenten die de agent moet weten, hier enkel gebruikt bij SearchAgent om mee te geven welke functie deze moet gebruiken | fn=bfs, fn=dfs, fn=ucs, fn=astar | /
 --frameTime FRAMETIME | | Hoeveel tijd er tussen de frames zit, als je niet te veel wil wachten kan je FRAMETIME=0 nemen | >= 0 is de tijd in secondes, < 0 zorgt ervoor dat je het met je toetsenbord verandert | 0.1

 ## Type variabelen

In deze opdracht wordt er gebruik gemaakt van een aantal variabelen, specifiek voor deze opdarchten. Hieronder de meest gebruikte

### Stack, Queue en PriorityQueue

Deze datastructuren worden in `util.py` gedefinieerd en doen exact wat je van ze zou verwachten.

Alle drie hebben de volgende functies:
* `push(item)` / `push(item, priority)`
    * Duw `item` op de stack, bij een priorityqueue moet je ook de pioriteit meegeven
* `pop()`
    * Return het volgende item
* `isEmpty()`
    * Spreekt voor zich; True als de datastructuur leeg is, False als er items in zitten

### Counter

Een counter (ook uit `util.py`) gedraagt zich zoals een dictionary en maakt dus gebruik van een key/value pair. Deze counter is specifiek gemaakt om ints/floats te hebben als value, maar dat hoeft niet specifiek.

Functies:
* `incrementAll(keys, count)`
    * Zal `count` optellen bij alle values van `keys`
* `argMax()`
    * Returnt de key die de grootste value heeft
* `sortedKey()`
    * Returnt een lijst van keys gesorteerd op value
* `totalCount()`
    * Returnt de som van alle values
* `normalize()`
    * Zorgt ervoor dat de som van alle values gelijk is aan 1 terwijl de verhoudingen hetzelfde blijven
* `divideAll(divisor)`
    * Deel alle values door `divisor`
* `copy()`
    * Returnt een kopie van de counter

### Grid

Een tweedimensionale array, geïmplementeerd als lijsten in een lijst. De grid is gedefinieerd in `game.py`

Functies:
* `copy()` = `deepCopy()`
    * Returnt een kopie van de grid
* `count(item=ITEM)`
    * Returnt hoeveel waarden in de grid gelijk zijn aan `ITEM`.
* `asList(key=KEY)`
    * Returnt een lijst met tuples van coördinaten waar de waarde gelijk is aan `KEY`

[//]: # (TODO: add shallowCopy and packBits)

## Opgave 1

In deze opgave moet je `depthFirstSearch` implementeren in `search.py`.

Meer info over depthFirstSearch vind je [hier]().

[//]: # (TODO: add link)

Hier zijn een aantal puntjes met wat onze functie moet doen:
* Door alle vakjes gaan tot we ons doel bereikt hebben
* Bijhouden waar we al geweest zijn zodat we niet in een oneindige loop vast komen te zitten

### Commando's om te zien of alles werkt

```
python pacman.py -l tinyMaze -p SearchAgent
python pacman.py -l mediumMaze -p SearchAgent
python pacman.py -l bigMaze -z .5 -p SearchAgent
python autograder.py -q q1
```

### Een aantal tips

#### Problem

Je krijgt `problem` mee in de functie. Deze variabele is van de klasse `SearchProblem`. De functies die je kan toepassen op `problem` staan bovenaan in `search.py`. Voor de gemakkelijkheid heb ik de uitleg ook hier gezet, zo kan je onderstaande tabel ook gebruiken.

Functie | Input | Returnt | Uitleg
--- | --- | --- | ---
`problem.getSartState()` | \ | (x, y) [Tuple] | Deze functie returnt de coördinaten van het startpunt van pacman in een tuple.
`problem.isGoalSate(state)` | state = (x, y) | [Boolean] | Als de state die je meegeeft die goal is, zal je `True` krijgen, anders `False`
`problem.getSuccessors(state)` | state = (x, y) | Een array van tuples: (successor, action, cost) | Hier wordt een array gereturnt. In deze array zitten tuples van alle legale moves die gedaan kunnen worden vanuit `state`. De tuple bevat 3 variabelen: de nieuwe state, de actie die uitgevoerd moet worden om daar te geraken en de kost.
`problem.getCostOfActions(state, actions)` | state = (x, y) [Tuple], actions = array van acties | cost [int] | Je zal de kost van de acties die je meegeeft terugkrijgen als je start in `state`. Als je een illegale move maakt, zal 999999 gereturnt worden.

#### Uiteindelijke pad

Op het einde van je functie, als je de goal gevonden hebt, zal je een array van actions moeten returnen. Je kan de actions gebruiken die je krijgt van `problem.getSuccessors(state)`.

Om het niet te moeilijk te maken moet je eens denken over hoe een Stack werkt en wat je naast de state op de stack kan zetten...

## Opgave 2

In de plaats van `depthFirstSearch` ga je nu `breadthFirstSearch` doen.

Meer info over breadthFirstSearch vind je [hier]().

[//]: # (TODO: add link)

### Commando's om te zien of alles werkt

```
python pacman.py -l mediumMaze -p SearchAgent -a fn=bfs
python pacman.py -l bigMaze -p SearchAgent -a fn=bfs -z .5
python eightpuzzle.py
pyhton autograder.py -q q2
```

### Een aantal tips

#### Vrij gelijkaardig

Als je een beetje van de theorie weet, zie je dat DFS en BFS eigenlijk heel hard op elkaar lijken, met één groot verschil. Je kan hier dus een groot deel van je code van opgave 1 hergebruiken en een paar aanpassingen maken...

## Opgave 3

Nu moet `uniformCostSearch` aangepast worden zodat je het "beste" pad kan definiëren door een kostfunctie te gebruiken. Een kostfunctie zelf definiëren is niet simpel, daarom moet je gewoon proberen om het pad met de kleinste totale kost te vinden.

Meer info over uniformCostSearch vind je [hier]().

[//]: # (TODO: add link)

###  Commando's om te zien of alles werkt

```
python pacman.py -l mediumMaze -p SearchAgent -a fn=ucs
python pacman.py -l mediumDottedMaze -p StayEastSearchAgent
python pacman.py -l mediumScaryMaze -p StayWestSearchAgent
python autograder.py -q q3
```

De `StayEastSearchAgent` en `StayWestSearchAgent` hebben een kostfunctie die hun zo oostelijk/westelijk op het bord wil houden. Het zal er op lijken dat bij de `StayWestAgent` pacman de ghosts negeert, maar dat is gewoon omdat hij zo west (rechts) mogelijk op het bord wil zijn.

### Een aantal tips

#### Opnieuw vrij gelijkaardig

Ook hier zal je zien dat de functies redelijk hard op elkaar lijken. Het verschil is dat er gebruikt gemaakt wordt van een andere datastructuur, maar bij deze moet je dan nog iets extra meegeven rekening houdend met het doel van UCS...

## Opgave 4

Het laatste zoekalgoritme dat je gaat implementeren is A*. Dit algoritme houdt rekening met een heuristiek om zo sneller en efficënter een goed pad te vinden.

Meer info over A* vind je [hier]().

[//]: # (TODO: add link)

###  Commando's om te zien of alles werkt

```
python pacman.py -l bigMaze -z .5 -p SearchAgent -a fn=astar,heuristic=manhattanHeuristic
python autograder.py -q q4
```

### Een aantal tips

#### Heuristiek krijgen

Om de heuristiek voor een bepaalde state te krijgen, gebruik je het commando `heuristic(state, problem)`.

#### Wat een verrassing, het is weer vrij gelijkaardig!

A* lijkt redelijk hard op UCS, het enige verschil is dat je nu óók rekening moet houden met de heuristiek van de state...

## Opgave 5

In de vorige vragen was het doel om steeds al het eten op te eten, nu hebben we een ander doel: de 4 hoeken bereiken. Om dit te doen zal je in `searchAgent.py` de klasse `CornerProblem` (regel 269 - 344) afwerken.

Je zal aanpassingen moeten maken in:
```python
__init__(self, startingGamestate)
getStartSate(self)
isGoalState(self, state)
getSuccessors(self, state)
```

###  Commando's om te zien of alles werkt

```
python pacman.py -l tinyCorners -p SearchAgent -a fn=bfs,prob=CornersProblem
python pacman.py -l mediumCorners -p SearchAgent -a fn=bfs,prob=CornersProblem
python autograder.py -q q5
```

### Een aantal tips

#### Andere problemen

Bekijk `FoodSearchProblem` in `searchAgents.py` (regel 371 - 420) eens en probeer te snappen wat er gebeurt. Dit probleem is opgesteld zodat al het eten opgegeten wordt, maar als je snapt waarom sommige dingen gedaan worden, kan je dit gebruiken in jouw code.

#### State

De variabele `state` is de enige variabele die doorgegven wordt. Deze zal dus niet enkel de coördinaten bevatten van pacman.

Als je in `FoodSearchProblem` kijkt zie je dat `state` = `(pacmanPosition, foodGrid)` met:
* `pacmanPosition` = `(x, y)`
* `foodGrid` = een Grid (matrix) de grootte van de map en `True` of `False` als er al dan niet eten op die coördinaat is

Voor deze opgave is de foodGrid niet belangrijk, dus er zal gekeken moeten worden naar wat bijgehouden moet worden.
Tip: in `__init__` wordt `self.corners` bijgehouden, misschien ben je daar iets mee...

#### Recycling

Je kan het grootste deel van `getSartState`, `isGoalState` en `getSuccessors` uit `FoodSearchProblem` hergebruiken met een aantal aanpassingen om zo ons doel te verwezelijken.

## Opgave 6

Nu ga je een heuristiek moeten schrijven voor het `CornersProblem` in `cornersHeuristic`.

Meer info over heuristieken vind je [hier]().

[//]: # (TODO: add link)

### Commando's om te zien of alles werkt

```
python pacman.py -l mediumCorners -p AStarCornersAgent -z 0.5
python autograder.py -q q6
```

De hoeveelheid punten die je krijgt van de autograder hangen af van hoe efficiënt het zoekalgoritme werkt met je heuristiek.

### Een aantal tips

...

[//]: # (TODO: add tips)

## Opgave 7

In deze opgave moet je weer een heuristiek schrijven, maar dit keer voor `FoodSearchProblem` in `foodHeuristic`

### Commando's om te zien of alles werkt

```
python pacman.py -l trickySearch -p AStarFoodSearchAgent
python autograder.py -q q7
```

### Een aantal tips

...

[//]: # (TODO: add tips)

## Opgave 8

Opgave 8 verwacht dat je een greedy algoritme schrijft dat steeds het dichtstbijzijnde eten zal opeten in `findPathToClosestDot`.

Je zal eerst nog `isGoalState` in `AnyFoodSearchProblem` moeten aanvullen.

### Commando's om te zien of alles werkt

```
python pacman.py -l bigSearch -p ClosestDotSearchAgent -z .5
python autograder.py -q q8
```

### Een aantal tips

#### isGoalState

Je hebt in `CornersProblem` deze functie al eens moeten aanvullen, misschien kan je daar wat van hegebruiken...

#### Dichtsbijzijnd eten?

Als eerste stap in je algoritme zal je de coördinaten van het dichtstbijzijnde eten moeten zoeken. Je zal iets moeten zoeken zoals `manhattanDistance` dat rekening houdt met muren. Misschien moet je dit zelf niet eens schrijven en staat er zo iets in `searchAgents.py`...

#### Pad zoeken

Als je het dichtsijzijnde eten gevonden hebt, moet je nog zien hoe je daar geraakt. Als je in de vorige tip de juiste functie gevonden hebt, moet je eens kijken wat deze methode doet en hoe deze dat doet. De oplossing staat er bijna letterlijk in...