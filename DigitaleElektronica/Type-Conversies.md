# [EI-Wiki](..)/[Digitale Elektronica](Home)/Type-Conversies
## std_logic_vector -> unsigned
```vhdl
signal std : std_logic_vector(3 downto 0);
signal uns : unsigned(3 downto 0);

uns <= unsigned(std);
```

## unsigned -> std_logic_vector
```vhdl
signal std : std_logic_vector(3 downto 0);
signal uns : unsigned(3 downto 0);

uns <= std_logic_vector(std);
```

## unsigned -> integer
```vhdl
signal int : integer;
signal uns : unsigned(3 downto 0);

int <= to_integer(uns);
```

## integer -> unsigned
```vhdl
signal int : integer;
signal uns : unsigned(3 downto 0);

-- De 4 is de lengte van de unsigned
uns <= to_unsigned(int, 4)
```