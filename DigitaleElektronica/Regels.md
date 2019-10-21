# [EI-Wiki](..)/[Digitale Elektronica](Home)/Regels
## Regels voor een combinatorisch proces
1. Alle signalen die gelezen worden, moeten in de sensitivity list staan  
  voorbeeld:
```vhdl
pNaam: process (A,B,C,D) --Deze signalen moeten in de sensitivity list staan want ze worden gelezen/bewerkt in dit proces
begin 
  F<= D or C;
  D<= A and B;
end process pNaam; 
```

2. Alle signalen die een waarde krijgen, moeten altijd een waarde krijgen  
  voorbeeld:
```vhdl
    if input1 = '1' then 
      output1 <= '1'; 
    else 
      output1 <= '0'; -- bij if-statements altijd een else voor andere gevallen includeren
    end if; 
``` 

## Regels voor Flip Flops
1. __
2. __
