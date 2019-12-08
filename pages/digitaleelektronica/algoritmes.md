<!--
{"indexdepth": 1}
-->
# [Digitale Elektronica](Home)/Packages
## LFSR (Lineair-Feedback Shift Register)

Lineair-Feedback Shift Register of kort LFSR is een algoritme dat gebruikt wordt om psuedo random waardes te genereren gebruik makende van een schuif register.

### Fibonacci LFSR
Een LFSR is een schuifregister waarbij enkele uitgangen teruggekoppeld worden met een XOR port. We noemen deze uitgangen taps. De taps worden ook sequentieel ge-XOR'ed. De uitgang van a deze taps wordt teruggekoppeld naar de most significant bit of left most bit.

Hier is een afbeelding met wat verduidelijking:

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/LFSR-F16.svg/351px-LFSR-F16.svg.png" class="max-h-200 max-w-500">

#### Taps
Voor een 16-bit LFSR worden vaak de volgende taps gebruikt: [16, 14, 13, 11] dit wordt meestal mooier voor gesteld met een polynoom, die de feedback polynomial genoemd wordt:
$$x^16 + x^14 + x^13 + x^11 + 1$$

Om taps te maken voor een LFSR moeten we ons aan volgende voorwaarden houden:
* Het aantal taps is even
* Alle taps zijn setwise co-prime. Dit betekend dat de grootse gemene deler van alle taps gelijk is aan 1.

### Genereren van getallen
Om getallen te kunnen genereren hebben we eerst een seed nodig. Dit is een waarde die we initieel aanleggen op het schuifregister.

Als de seed hetzelfde is voor 2 aparte schuifregisters zal hun output ook altijd hetzelfde zijn. Het is dus belangrijk dta we de seed ook vrij willekeurig kiezen.

### Bronnen
* [Wikipedia](https://en.wikipedia.org/wiki/Linear-feedback_shift_register)
* Digitale Elektronica 4de editie - Koen Lostrie (ISBN 978 90 382 2297 4)

## Bresenham
