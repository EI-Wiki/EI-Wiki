# [EI-Wiki](..)/[Digitale Elektronica](Home)/Types
## std_logic
`std_logic` is een type dat 1 bit bevat (`1` or `0`).

Om een waarde te geven aan een `std_logic` heb je een `'` nodig.

```vhdl
signal bit : std_logic := '1';

pAssignBit : process
begin
    -- Geef het signaal 'bit' de waarde '0'.
    bit <= '0';
end process;

```

## std_logic_vector

`std_logic_vector` is een type dat meerdere bits (`1` or `0`) bevat.

Om een waarde aan een `std_logic_vector` toe te kennen gebruik je een `"`.

Een `std_logic_vector` heeft ook altijd een grootte nodig:

`<Upper Bound> downto <Lower Bound>` or `<Lower bound> to <Upper Bound>`

In digitale elektronica gebruiken we voornamelijk `downto`. Pas zeker op met het door elkaar gebruiken van `to` en `downto`, dit kan namelijk voor zeer irritante bugs zorgen.

```vhdl
signal bits : std_logic_vector(3 downto 0) := '1';

pAssignBits : process
begin
    -- Geef signaal 'bits' de waarde '1111' of 15
    bits <= "1111";
end process;

```

## unsigned & signed

In de informatica (dus niet enkel in de digitale elektronica) spreken we vaak over 2 'signed numbers' en 'unsigned numbers'. Het verschil is zeer simpel maar op bit niveau wat ingewikkelder.

Het grote verschil tussen een 'unsigned number' en een 'signed number' is dat een signed zowel positief als negatief kan zijn en een unsigned enkel positief.

Een signed getal zal dus ook negatieve getallen kunnen bevatten enkel gaat dit ten koste van de limiet. Dit komt omdat een signed een teken bit gebruikt en een unsigned zal hier geen last van ondervinden.

Hoe signed getallen worden gevormd met 2's complement. Hieronder vind je een paar interresante links over 2's complement.

### 2's Complement
* [2's Complement (EN)](https://en.wikipedia.org/wiki/Two%27s_complement)
* [2's Complement (NL)](https://nl.wikipedia.org/wiki/Two%27s_complement)

## integer
Een integer is een signed getal met een bit-lengte van 32. Dit betekent dus dat een integer 31 bits nodig heeft om 1 getal te vormen en een extra bit gebruikt om het teken te vormen.

## Array
Een array is een type dat meerdere elementen bevat van een ander type. Een array heeft altijd een op voorhand gespecifieerde lengte.

```vhdl
-- Dit is een array van het type integer met een lengte van 4.
type tArray is array(0 to 3) of integer;

-- Dit is een signaal met het type de array 
-- die we hierboven gedefinieerd hebben.
signal arr : tArray := (0, 1, 2, 3);

pReadArrayValue : process(index)
begin
    -- Geef de output de waarde op positie 'index' in de array 'arr'.
    output <= arr(index);
end process;
```