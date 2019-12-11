# Regels
## Regels voor een combinatorisch proces
1. Alle signalen die gelezen worden, moeten in de sensitivity list staan  
  voorbeeld:
```vhdl
-- Deze signalen (A, B, C, D) moeten in de sensitivity list staan,
-- want ze worden gelezen in dit proces.
pNaam: process (A, B, C, D) 
begin 
  E <= A and B;
  F <= D or C;
end process pNaam; 
```

2. Alle signalen die een waarde krijgen, **moeten altijd** een waarde krijgen  
  voorbeeld:
```vhdl
    -- Altijd een waarde vooraf toekennen aan signalen
    -- om latches te vermijden
    -- Ook bij if-else statements is dit aangeraden, maar niet verplicht.
    output1 <= '0';

    if input1 = '1' then 
      output1 <= '1'; 
    else 
      output1 <= '0';
    end if; 
``` 

## Regels voor Flip Flops
1. Flip flops worden beschreven met een synchroon proces.
2. De sensitivity list van dat proces moet exact bevatten:
   * Het kloksignaal
   * Eventueel asynchrone ingangen (set, reset, clock enable)

Voorbeeld:

```vhdl
pFlipFlop : process(clk)
begin
  if rising_edge(clk)
  then
    -- Hier komen Synchrone signalen
    A <= B;
  end if;

  -- Hier komen assynchrone signalen

end process;
```
