# [EI-Wiki](..)/[Digitale Elektronica](Home)/Syntax
## Operatoren
### Waarde Toekenning
Om waardes toe te kennen in vhdl gebruiken we **niet** de standaard `=` zoals we gewoon zijn bij programeertalen. In vhdl zijn er hier 3 operatoren voor, namelijk : `<=`, `:=`, `=>`.

`<=` wordt enkel gebruikt als we een waarde toekennen terwijl we in een proces zitten. Dit komt omdat deze waarde dan wordt gezet bij de volgende time step.

`:=` wordt typisch gebruikt om initieële waardes te zetten op signalen, Generics, ... De operator wordt ook gebruikt om waardes van variablen direct een waarde te geven. Echter zijn variabelen niet van toepassing in Digitale Elektronica 1 en 2.

`=>` wordt enkel gebruikt om een signaal toe te kennen aan een poort van een component. Dit wordt gedaan in de Port map.

### +, -, *, /
De operatoren `+`, `-`, `*`, `/` doen exact hetzelfde in vhdl als in programeertalen.
* `+`: Telt 2 waardes bij elkaar op.
* `-`: Trekt 2 waardes van elkaar af.
* `*`: Vermenigvuldigt 2 waardes.
* `/`: Deelt 2 getallen.

**PAS OP**: `/` mag **NIET** gebruikt worden in Digitale Elektronica 1 en 2. Echter als het over een macht van 2 gaat is het wel toegestaan.

### Is Gelijk Aan
De `=` of 'is gelijk aan' operator bestaat wel in vhdl zoals je gemerkt zou hebben deze dient louter om 2 waardes te vergelijken.
Zo zal de operator `'1'` (of `true`) geval als resultaat als twee waarden aan elkaar gelijk zijn en `'0'` (of `false`) als ze niet aan elkaar gelijk zin.

### Is Niet Gelijk Aan
De `/=` of 'is niet gelijk aan' operator doet exact het tegenovergestelde van de `=` operator.
Zo zal de operator `'0'` (of `false`) geval als resultaat als twee waarden aan elkaar gelijk zijn en `'1'` (of `true`) als ze niet aan elkaar gelijk zin.

### Groter/Kleiner dan (of gelijk aan)
`<`:  groter dan

`<=`: groter dan of gelijk aan

`>`: Kleiner dan

`>=`: Kleiner dan of gelijk aan