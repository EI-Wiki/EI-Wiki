# [EI-Wiki](..)/[Digitale Elektronica](Home)/Types
## std_logic
`std_logic` is een type dat 1 bit bevat (`1` or `0`).

Om een waarde te geven aan een `std_logic` heb je een `'` nodig.

```vhdl
signal bit : std_logic := '1';

pAssignBit : process
begin
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
    bits <= "0";
end process;

```

## unsigned & signed

## integer