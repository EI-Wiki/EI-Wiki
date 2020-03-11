# 0. C++ Abstracties
## 0.0 Software Design patterns
Software design patterns zijn herbruikbare oplossingen op veel voorkomende software problemen. Ze zijn geen kant en klare oplossing, maar eerder een implementatie template.

Er zijn veel design patterns maar we focussen ons hier meer op abstract factories en singletons. 

## 0.1 Abstract Factories
### Factories
Een factory is een klasse die andere klasses maakt. Dit wil zeggen dat je met een factory nieuwe instanties kan maken van een bepaald object zonder zijn constructor direct aan te roepen. Deze design pattern wordt minder gebruikt.

### Abstract Factories
Een abstracte factory is een factory die abstracte instanties geeft. Een abstracte factory is ook altijd zelf abstract.

Een abstracte factory kunnen we gebruiken als we de volledige context van een object niet kennen in het hoofdprogramma.
In ons geval zullen we een abstracte factory maken om SDL specifieke klasses te maken.

### Visualisatie

<img src="/media/cpp/sdl/abstractfactory.svg" class="max-h-200 max-w-500">

1. Hier vragen we aan onze abstracte factory in het hoofdprogramma een object te creeëren voor ons. Onze abstracte factory is eigenlijk achter de schermen een SDLFactory en de method call zal dus doorgegeven worden naar SDLFactory.

2. De SDLFactory maakt een SDLObject aan en stuurt deze terug door naar het hoofdprogramma. Enkel tijdens zijn weg teug naar het hoofdprogramma zal het SDLObject worden geïnterpreteerd als een AObject.

3. We roepen een method aan die gedefiniëerd staat in AObject, echter is deze method abstract (virtual). Doordat de method abstract is zal de method definitie van SDLObject gebrukt worden.

### Voorbeeld code:
Download de voorbeeld code [hier](/media/cpp/sdl/code/0-1-abstractfactories.zip).


## 0.2 Singletons

### Singleton
Een singleton is een software desing pattern dat het aantal instanties van een object limiteerd tot één(single) enkele instantie. Dit is een handige design pattern als er acties in een project door één object moeten worden gedicteerd. Bijvoorbeeld een GameController.

### Voorbeeld code

Download de voorbeeld code [hier](/media/cpp/sdl/code/0-2-singletons.zip).

## Bronnen
* [Wikipedia - Software Design Patterns](https://en.wikipedia.org/wiki/Software_design_pattern)
*[Wikipedia - Singleton Pattern](https://en.wikipedia.org/wiki/Singleton_pattern)