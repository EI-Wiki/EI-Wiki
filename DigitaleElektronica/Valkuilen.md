{% include head.html %}
# [EI-Wiki](..)/[Digitale Elektronica](Home)/Valkuilen

## Valkuil 1: VHDL heeft GEEN variabelen
In vhdl wordt de waarde van een signaal pas aangepast op het einde van een process.

voorbeeld:
```vhdl
signal A : integer := 1;
signal B : integer := 0;

pAProcess : process(A)
begin
    -- B is hier gelijk aan 0.
    B <= A; -- B is hier ook gelijk aan 0
    -- B is nog steeds gelijk aan 0
end process;
-- Pas vanaf het proces hier eidigt is B gelijk aan 1.
```

## Valkuil 2: '=' is niet '<='
Om een waarde toe te kennen aan een signaal gebruik je geen `=` maar een `<=`.

## Valkuil 3: 'inout' bij poorten
Veel studenten gebruiken `inout` voor hun poorten om zo de waarde op deze poort te kunnen lezen en schrijven. Echter is dit niet toegestaan in digitale elektrnica 1 en 2. Gebruik hiervoor signalen. Om een signaal te linken aan een poort gebruik volgende code:

```vhdl
...

entity BCDTo7SegmentConverter is
    Port (Output : out std_logic_Vector(3 downto 0));
end BCDTo7SegmentConverter;

...

signal outp : std_logic_Vector(3 downto 0);

...

pSomething : process(...)
begin
    -- Do iets
    outp <= ...,
end process;

pSomethingElse : process(outp)
begin
    if(outp = ...)
    then
        -- Doe iets
    end if;
end process;

pOutput : process(outp)
begin
    Output <= outp;
end process;
```

of korter zonder een omliggend proces:
```vhdl
...

Output <= outp;
```

## Valkuil 4: foute target language
Zorg dat je target language in Vivado zeker op VHDL staat in niet op Verilog.


