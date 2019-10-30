# [EI-Wiki](..)/[Object Georiënteerd Programmeren](Home)/Syntax

## Comentaar
Om comentaar bij een functie of tussen je code wilt hebben kan je gebruik maken van ``//`` (voor 1 enkele lijn van comentaar).

**IMAGE**

Indien je meerdere lijnen commentaar wilt hebben kan je een block comment plaatsen. In bepaalde IDE's heb je een shortcut op de geselecteerde lijnen om te zetten naar een block comment (In IntelliJ IDEA is het ``Shift + /``). Het begin van een block comment begint met ``/*`` en het eindigt met ``*/``, alle lijnen die er tussen staan zullen als commentaar gezien worden. 

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

