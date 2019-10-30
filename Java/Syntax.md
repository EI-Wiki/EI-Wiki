# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Syntax

## Conditions (Voorwaardelijken)
### if statement
De `if` statement wordt gebruikt op te kijken of iets waar is. Als je wilt kijken of iemand ouder is als 16 jaar, doe dan dit... Kan je dat met een if statement doen.

**IMAGE**

Als je ook iets wilt doen als de statement niet waar is, op die zelfde if statement gebruik je `else`. Als de persoon dus niet ouder is als 16 jaar, doe dan dit...

**IMAGE**

Als je nog een check wilt doen van dezelfde if statement. Dan maak je gebruik van een `else if` statement.

**IMAGE**

### Swtich statement
Als je een veriabele hebt die meerdere waardes heeft en je wilt voor elke waarde iets doen, kan je gebruik maken van een `Switch` statement. Als je nu wilt kijken of een persoon 8 jaar, 12 jaar, 16, jaar, 21 jaar is en iets wilt doen bij elk van deze waardes. Je kan dit ook doen met een if statement en voor elke waarde een else if maken. 

**IMAGE**

## Loops (Lussen)
### For loop
Een ``for`` loop kan op verschillende manieren gebruikt worden:
- als een loop die een beperkt aantal keren iets doet. (normal use)
- als een loop die voor elke waarde iets te doet (for each loop)
- als een iteraties loop (iterator)

**IMAGE**

**IMAGE**

**IMAGE**


### While loop
Een `while` loop is een loop die blijft loopen tot dat de voorwaarde `false` of `0` is. (De voorwaarde wordt eerst nagekeken voordat er iets wordt uitgevoerd)

**IMAGE**

De while loop heeft ook een speciale versie, `de Do-While` loop, deze loop doet eerst wat je wilt doen en dan kijkt hij pas of de voorwaarde nog steeds klopt. Hiermee kan je ook een `Iterator` maken

## Comentaar
Om comentaar bij een functie of tussen je code wilt hebben kan je gebruik maken van ``//`` (voor 1 enkele lijn van comentaar).

**IMAGE**

Indien je meerdere lijnen commentaar wilt hebben kan je een block comment plaatsen. In bepaalde IDE's heb je een shortcut op de geselecteerde lijnen om te zetten naar een block comment (In IntelliJ IDEA is het ``Ctrl + Shift + /``). Het begin van een block comment begint met ``/*`` en het eindigt met ``*/``, alle lijnen die er tussen staan zullen als commentaar gezien worden. 

**IMAGE**

### JavaDoc
JavaDoc is ook een soort commentaar. JavaDoc wordt alleen in het begin van een method gebruikt en geeft dan een uitleg over de method en zijn parameters. 

**IMAGE**

JavaDoc wordt meestal ook online gezet, hierdoor kan men makkelijk begrijpen wat de code doet zonder naar de source code te gaan kijken.
In JavaDoc zijn er heel wat elementen die je er in kan gebruiken, je zult ze nooit allemaal moeten gebruiken, maar hier zijn ze:
- `@author`: programmeur van de code.
- `@deprecated`: als de methode veroudert is (eigenlijk niet meer gebruikt wordt).
- `@exception`: 
- `@param`: definieert een parameter van een methode. Verplicht voor iedere parameter.
- `@return`: definieert een teruggegeven waarde (niet verplicht bij type void).
- `@returns`: zelfde als @return.
- `@see`: verwijst naar een andere method/klasse.
- `@since`: geeft aan wanneer een methode is toegevoegd in de klasse.
- `@throws`: zelfde als exception.
- `@version`: versie van de methode of klasse.

**IMAGE**

