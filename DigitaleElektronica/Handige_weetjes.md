# Weetjes
Hier kan je handige weetjes, en zelfs voorbeeld code vinden. Alles wat hier te vinden is zeer specifiek, maar zal nog steeds naar andere pagina's verwijzen.

## Flip Flops
Flip flops moet je nooit tot op poort niveau gaan beschrijven, dit doet Vivado zelf. Je moet wel de regels van de flip flops respecteren (zie [regels]()).
Als er in een opgave iets gezegt wordt over Synchrone of Assynchrone, moet je ze op de juiste plaats zetten. Als het synchrone moet zijn moet je eerst kijken of het een `rising_edge()` is (de code is dan in sync met de rising_edge).
Als het assynchrone moet zijn maakt het niet uit waar het staat, zolang het in hetzelfde process staat en niet tussen de rising_edge.

```vhdl
pFlipFlop : process(clk, reset)
begin
  if (reset = '1') then
    --reset
  elsif rising_edge(clk) then
    -- Hier komen Synchrone code
    A <= B;
  end if;

  -- Hier komen Assynchrone code

end process;
```

## Clock signal
De FPGA bordjes dat wij gebruiken heeft een clock signaal van 100MHz (vergeet deze niet te activeren in je XDC), in de eerste BA mag je geen IP blocken gebruiken.
Als je nu deze wilt omzetten moet je een teller gaan maken, die als het zijn tel heeft berijkt een signaal op of af zet (0 of 1).

```vhdl
process(Clk)
begin
    if( rising_edge(Clk) ) then --Synchroon
        if(counter < divide/2-1) then -- zolang de counter onder de helft van de deler zit, moet het signaal op 0 staan
            counter <= counter + 1; 
            Clk_mod <= '0'; --Signaal hervormt (lage pulse)
        elsif (counter < divide-1) then -- zolang de counter over de helft zit van de deler, moet het signaal op 1 staan
            counter <= counter + 1;
            Clk_mod <= '1'; -- Signaal hervormt (hoge pulse)
        else
            Clk_mod <= '0';
            counter <= 0;
        end if;
    end if;
end process;
```
bv: als je van 100MHz naar 20Hz moet, is devide = 5000000.

In de 2de BA heb je IP blocken gezien, in vivado zit een handige clocking wizzard. Hiermee kan je eerder welke clock ingeven en hervormen naar je gewenste clock (de clocking wizzard kan mixumum tot 4.8MHz)
