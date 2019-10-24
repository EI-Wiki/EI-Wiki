# [EI-Wiki](..)/[AI](Home)/Lab 1 - Searching
## Introductie

Dit deel van de wiki gaat over de opdrachten van lab 1 (practicumsessies 1 & 2).

[Opgave](https://inst.eecs.berkeley.edu/~cs188/fa18/project1.html)

We gaan proberen om een algoritme Pacman te laten spelen adhv zoekalgoritmes.

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
| | --frameTime FRAMETIME | Hoeveel tijd er tussen de frames zit | >= 0 is de tijd in secondes, < 0 zorgt ervoor dat je het met je toetsenbord verandert | 0.1

## Opgave 1

In deze opgave moet je depthFirstSearch implementeren in `search.py`.

Meer info over depthFirstSearch vind je [hier]().

Hier zijn een aantal puntjes met wat onze functie moet doen:
* Door alle vakjes gaan tot we ons doel bereikt hebben
* Bijhouden waar we al geweest zijn zodat we niet in een oneindige loop vast komen te zitten

### Een aantal tips

#### Problem

Je krijgt `problem` mee in de functie. Deze variabele is van de klasse `PositionSearchProblem` in `searchAgents.py` regel 136 - 227. Daar staan de functie die je kan toepassen op `problem`. Als je niet naar de achterliggende code wil kijken, dan kan je ook onderstaande tabel gebruiken.

Functie | Input | Returnt | Uitleg
--- | --- | --- | ---
`problem.getSartState()` | \ | (x, y) [Tuple] | Deze functie returnt de coördinaten van het startpunt van pacman in een tuple.
`problem.isGoalSate(state)` | state = (x, y) | [Boolean] | Als de state die je meegeeft die goal is, zal je `True` krijgen, anders `False`
`problem.getSuccessors(state)` | state = (x, y) | Een array van tuples: (successor, action, cost) | Hier wordt een array gereturnt. In deze array zitten tuples van alle legale moves die gedaan kunnen worden vanuit `state`. De tuple bevat 3 variabelen: de nieuwe state, de actie die uitgevoerd moet worden om daar te geraken en de kost.
`problem.getCostOfActions(state, actions)` | state = (x, y) [Tuple], actions = array van acties | cost [int] | Je zal de kost van de acties die je meegeeft terugkrijgen als je start in `state`. Als je een illegale move maakt, zal 999999 gereturnt worden.

#### Uiteindelijke pad

Op het einde van je functie, als je de goal gevonden hebt, zal je een array van actions moeten returnen. Je kan de actions gebruiken die je krijgt van `problem.getSuccessors(state)`.

Om het niet te moeilijk te maken moet je eens denken over hoe een Stack werkt en wat je naast de state op de stack kan zetten...

## Opdracht 2
