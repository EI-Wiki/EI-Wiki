# [EI-Wiki](..)/[Digitale Elektronica](Home)/Testbenches
## Het nut van simuleren
Simuleren lijkt in de ogen van veel studenten volstrekt nutteloos, maar kan soms echt goed van pas komen. Hier zijn enkele redenen waarom we beter simuleren an implementeren:

<!--TODO: Voeg meer uitleg bij de puntjes toe-->
* **Het duurt veel minder lang**
* **Betere kijk op interne signalen**
* **Automatische tests uitvoeren**

## Regels in de testbench
Niet van toepassing, doe zo zot mogelijk.

## Starten van een proces bij start simulatie
Als je een proces wil laten starten bij de start van de simulatie kan je dit simpel doen door de sensitivity list leeg te maken.

Volgend proces zal een klok genereren met periode 20ns genereren:

```vhdl
signal clock : std_logic := '0';

pClock : process
begin
    clock <= not clock;
    wait for 10ns;
end process;
```

De `wait for <time>;` regel is nodig om signalen te doen updaten. 

## Zelftestende Testbenches (Digitale Elektronica 2)
Zelftestende testbenches kunnen we vergelijken met unit tests uit de programmeerwereld. Ze kijken of onze programma's werken.

Een zelftestende testbench wordt in het vak Digitale Elektronica 2 gegeven. De opdrachten bevatten tekstbestanden met daarin op voorhand gegenereerde correcte waardes. Bij elke opdracht wordt uitgelegd hoe dit bestand eruitziet.

### Lezen van bestanden
#### Toevoegen van een test bestand
Als we een test bestand gekregen hebben moeten we deze eerst in de correcte folder plaatsen. Deze folder bevindt zich hier: `<project folder>/<project naam>.sim/sim_1/behav/xsim`.

#### Packages toevoegen
Om een bestand te kunnen lezen moeten we eerst de juiste package(s) gebruiken. Dit kan door volgende regels toe te voegen aan je project:
```vhdl
use STD.textio.all;
use IEEE.std_logic_textio.all;
```

#### Lezen van het bestand
Als we een bestand willen lezen moeten we eerst een signaal maken voor dit bestand. Dit gebeurt op dezelfde plaats waar signalen worden gedeclareerd. Het file signaal ziet er zo uit:
```vhdl
file testFile : text;
```

Nu we een signaal hiervoor hebben gaan we ons proces opbouwen. We gaan in ons proces eerst het bestand opendoen:

```vhdl
pRead : process
begin
    file_open(testFile, "testfile.txt", read_mode);
end process;
```

Als we dan de eerste regel willen gaan lezen uit dit bestand gaan we een variabele moeten declareren:

```vhdl
pRead : process
    variable inLine : line;
begin
    file_open(testFile, "testfile.txt", read_mode);
end process;
```

Als we dan deze lijn willen lezen gebruiken we deze code:

```vhdl
pRead : process
    variable inLine : line;
begin
    file_open(testFile, "testfile.txt", read_mode);

    readline(testfile, inLine);
end process;
```

We hebben nu één lijn gelezen van ons bestand maar hebben nog steeds geen nuttige data om onze projecten mee te testen. Om dit te doen gaan we nog een variable declareren en de `read` functie gebruiken.

De `read` funtie leest altijd tot de volgende spatie of de lengte van het type.

Hier is een voorbeeld met integers:

```vhdl
pRead : process
    variable inLine : line;
    variable data : integer;
begin
    file_open(testFile, "testfile.txt", read_mode);

    readline(testfile, inLine);
    read(inLine, data);

    -- Do something with the data
end process;
```

Als we lussen gebruiken bij het inlezen maak dan zeker gebruik van de functie `endfile(<file>)` zodat je niet verder leest dan dat de file groot is. (Je kan misschien een zelftestende testbench schrijven om deze testbench te controleren)

```vhdl
pRead : process
    variable inLine : line;
    variable data : integer;
begin
    file_open(testFile, "testfile.txt", read_mode);

    while not endfile(testFile)
    loop
        readline(testfile, inLine);
        read(inLine, data);

        -- Do something with the data
    end loop;
end process;
```

### Reporting

Als we willen melden dat er iets is fout gelopen in onze testbench dan kunnen we dit doen met een report statement ze ziet er als volgt uit:

```vhdl
assert <condition> report <tekst> severity <info|warning|error>; 
```
Als onze conditie vals(false) is zal er een log bericht komen in de TCL Console met de gegeven severity. Hier is een voorbeeld:

```vhdl
-- Als data niet gelijk is aan expectedData zal
-- de tekst "This data is wrong" worden gelogd
assert data = expectedData report "This data is wrong" severity warning; 
```

#### Data naar tekst
Als je data wil toevoegen aa de gelogde tekst kan dit. De voornamelijkste structuur is de deze:

```vhdl
"Front text " & <type>'image(data) & " Back text!"
```

Voorbeelden:

```vhdl
report "This is an integer: " & integer'image(intData);

report "This bit (" & std_logic'image(bitData) & 
    ") could be 1 or 0"; 
```

Enkel voor std_logic_vectors zal je een special functie nodig hebben. Plaats deze functie waar je je signalen declareert:

```vhdl
function to_string ( a: std_logic_vector) return string is
    variable b : string (1 to a'length) := (others => NUL);
    variable stri : integer := 1; 
begin
    for i in a'range loop
        b(stri) := std_logic'image(a((i)))(2);
    stri := stri+1;
    end loop;
return b;
end function;
```
```vhdl
report "Bits for dayzz " & to_string(bitsData);
```