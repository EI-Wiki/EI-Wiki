# Digitale Elektronica 2 (Hulp bij opdrachten)
## LFSR (Lineair-Feedback Shift Register)

Lineair-Feedback Shift Register of kort LFSR is een algoritme dat gebruikt wordt om psuedo random waardes te genereren gebruik makende van een schuifregister.

### Fibonacci LFSR
Een LFSR is een schuifregister waarbij enkele uitgangen teruggekoppeld worden met een XOR port. We noemen deze uitgangen taps. De taps worden ook sequentieel ge-XOR'ed. De uitgang van a deze taps wordt teruggekoppeld naar de most significant bit of left most bit.

Hier is een afbeelding met wat verduidelijking:

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/LFSR-F16.svg/351px-LFSR-F16.svg.png" class="max-h-200 max-w-500">

#### Taps
Voor een 16-bit LFSR worden vaak de volgende taps gebruikt: [16, 14, 13, 11] dit wordt meestal mooier voor gesteld met een polynoom, die de feedback polynomial genoemd wordt:
$$x^{16} + x^{14} + x^{13} + x^{11} + 1$$

Om taps te maken voor een LFSR moeten we ons aan volgende voorwaarden houden:
* Het aantal taps is even
* Alle taps zijn setwise co-prime. Dit betekend dat de grootse gemene deler van alle taps gelijk is aan 1.

### Genereren van getallen
Om getallen te kunnen genereren hebben we eerst een seed nodig. Dit is een waarde die we initieel aanleggen op het schuifregister.

Als de seed hetzelfde is voor 2 aparte schuifregisters zal hun output ook altijd hetzelfde zijn. Het is dus belangrijk dat we de seed ook vrij willekeurig kiezen.

### Bronnen
* [Wikipedia](https://en.wikipedia.org/wiki/Linear-feedback_shift_register)
* Digitale Elektronica 4de editie - Koen Lostrie (ISBN 978 90 382 2297 4)

## Bresenham
Bresenham is een verzamelnaam voor line drawing algoritmes die gebasseerd zijn op het line drawing algoritme van Bresenham. Het is een algoritme dat nog veel gebruikt wordt in moderne graphische kaarten en graphische software libraries.

Bresenham wordt gebruikt omdat we geen 'echte' lijnen kunnen teken op een computerscherm. Deze bestaan uit allemaal kleine vierkantjes (pixels) en zijn dus niet oneindig klein.

### Error based Bresenham
Omdat we in de FPGA niet kunnen delen met alle getallen en al zeker niet makkelijk reëele getallen kunnen gebruiken, gebruiken we dus een error based Bresenham algoritme. Op wikipedia vinden we volgende pseudo code:

```python
plotLine(int x0, int y0, int x1, int y1)
    dx =  abs(x1-x0);
    sx = x0<x1 ? 1 : -1;
    dy = -abs(y1-y0);
    sy = y0<y1 ? 1 : -1;
    err = dx+dy;  /* error value e_xy */
    while (true)   /* loop */
        if (x0==x1 && y0==y1) break;
        e2 = 2*err;
        if (e2 >= dy) 
            err += dy; /* e_xy+e_x > 0 */
            x0 += sx;
        end if
        if (e2 <= dx) /* e_xy+e_y < 0 */
            err += dx;
            y0 += sy;
        end if
    end while
```

Dit algoritme simuleert als het ware de richtings coefficient, deze kunnen we namelijk niet bepalen door het gebrek aan deling in de FPGA.
We hebben een soort error (`err`) die zegt hoe hard we uitwijken van de lijn en we gaan dit dus daarna corrigeren.

### Bronnen
* [Wikipedia](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm#All_cases)

## Clock Domain Crossing

Clock domain crossing (cdc) is het het overzetten van data naar een blok met een andere klokfrquentie. CDC is lastig want we kunnen setup en holdtimes niet verzekeren bij de overgang en dit kan leiden tot metastabiele toestanden.

### Oplossingen
Om metastabiele toestanden te vermijden zijn er enkele oplossingen:
* Dubbel floppen
Je kan de signalen 2 keer door een flip flop sturen die op de eind klok loopt. De eerste flip flop is meta stabiel en kunnen we van de waarde niet zeker zijn. De tweede weten we zeker dat deze de juist waarde geeft.

* Signalen stretchen
Soms zal ons trager domein de signalen van de sneller blok missen. 
Om dit op te lossen kunnen we signalen stretchen, als we een signaal 2 keer zoalg als de lengte van de periode van het traag klok domein aanleggen, kunnen we zeker zijn dat het signaal ontvangen os door het traag klokdomein.

* Tussen de klokdomeinen een fifo plaatsen
Deze oplossing geldt in beide richtingen (traag <-> snel).

### Bronnen
* https://youtu.be/eyNU6mn_-7g