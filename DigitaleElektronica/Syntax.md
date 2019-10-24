# [EI-Wiki](..)/[Digitale Elektronica](Home)/Syntax
## Operators (Operatoren)
### Waarde Toekenning
Om waardes toe te kennen in vhdl gebruiken we **niet** de standaard `=` zoals we gewoon zijn bij andere programeertalen. In vhdl zijn er hier 3 operatoren voor, namelijk : `<=`, `:=`, `=>`.

`<=` wordt enkel gebruikt als we een waarde toekennen terwijl we in een proces zitten. Dit komt omdat deze waarde dan wordt gezet bij de volgende time step.

`:=` wordt typisch gebruikt om initieële waardes te zetten op signalen, Generics, ... De operator wordt ook gebruikt om waardes van variablen direct een waarde te geven. Echter zijn variabelen niet van toepassing in Digitale Elektronica 1 en 2.

`=>` wordt enkel gebruikt om een signaal toe te kennen aan een poort van een component. Dit wordt gedaan in de Port map.

### +, -, *, /
De operatoren `+`, `-`, `*`, `/` doen exact hetzelfde in vhdl als in programmeertalen.
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
`<`:  Groter dan

`<=`: Groter dan of gelijk aan

`>`: Kleiner dan

`>=`: Kleiner dan of gelijk aan

### Concatenate (&)
Om twee signalen achter elkaar te plakken gebruik je een `&`.

voorbeeld:
```vhdl
signal A : std_logic_vector(7 downto 0);
signal B : std_logic_Vector(3 downto 0) := "1001";
signal C : std_logic_Vector(3 downto 0) := "0110";

pConcat : process(B, C)
begin
    -- We zetten nu de waarde van A op "10010110"
    A <= B & C;
end process;
```

## Conditionals (Voorwaardelijken)
### If (als)
Een if statement runt de code in zijn scope als de conditie van de if waar (`true` of `'1'`) is. Bij VHDL wordt er altijd het woord `then` geschreven na de conditie van je if-statement.

```vhdl
if (A = B)
then
    -- Deze code runt als A en B dezelfde waarde hebben.
end if;
```

### Else (anders)
Een else statement komt altijd gepaard met een voorgaande if statement. Als de conditie van de vorige if/elsif statement vals (`false` of `'0'`) is zal de code in de scope van de else statement gerunt worden.

```vhdl
if (A = B)
then
    -- Deze code runt als A en B dezelfde waarde hebben.
else
    -- Deze code runt als A en B  niet dezelfde waarde hebben.
end if;
```

### elsif (else if, anders als)
Een elsif komt zoals een else ook altijd gepaard met een voorgaande if statement of een andere elsif statement. De code in de scope van de elsif runt enkel als alle voorgaande if of elsif statements vals(`false` of `'0'`) zijn.

```vhdl
if (A = B)
then
    -- De code hier runt als A en B dezelfde waarde hebben.
elsif(A > B)
then
    -- Deze code runt als A en B niet dezelfde waarde hebben
    -- EN als A strikt groter is dan B.
elsif(A - B = 1)
then
    -- Deze code runt als A en B niet dezelfde waarde hebben
    -- EN als A kleiner is dan B
    -- EN als A-B gelijk is aan 1
else
    -- Deze code runt enkel als alle voorgaande
    -- Condities vals(false of '0') zijn
end if;
```

## Loops (lussen)
### Loop
Een loop of lus is een element in programmeren of in vhdl dat code herhaaldelijk uitvoert.

### For loop
Een for loop is een lus die meestal gedefinieerd wordt om een bepaald aantal keer dezelfde code uit te voeren.

```vhdl
for I in 0 to 3
loop
    -- Deze code wordt 4 keer uitgevoerd.
end loop;
```

### While loop
Een while loop is een lus die blijft herhalen todat een conditie vals(`false` of `'0'`) bewezen is.

```vhdl
while A /= '1'
loop
    -- Deze code blijft uitgevoerd worden todat A = '1'.
end loop;
```

## Ports & Generics
### Ports
Ports zijn de in en outputs van je component.

```vhdl
Port(
    stdInt : in std_logic_vector(3 downto 0);
    stdOut : out std_logic_vector(3 downto 0));
```

### Generics

Generics zijn gelijkaardig aan ports enkel zijn het constante waarde die voor compilatie gezet worden. Generics moeten **altijd** een standaard waarde krijgen.

```vhdl
Generic(
    stgGeneric : std_logic_vector(3 downto 0) := "1111");
```