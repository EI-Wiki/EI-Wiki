{% include head.html %}
# [EI-Wiki](..)/[Digitale Elektronica](Home)/Packages
## Packages

Een package is een gewoon vhdl bestand waar we definities in kunnen plaatsen. We kunnen hier geen logica in schrijven (geen processen).
In dit bestand komen dus de component definities, constanten, functies, ...

Om een package aan te maken gebruiken we volgende syntax:
```vhdl
package MyPackage is
    -- Definities(component, functies) & Constanten
end MyPackage;

package body MyPackage is
    -- Functies
end package body MyPackage;

```

Om een package te gebruiken in je project voeg de volgende code toe:
```vhdl
use work.MyPackage.ALL;
```
Als je maar 1 definitie wil gebruiken uit de package vervang je `ALL` door de naam van de gewenste definitie.

## Libraries
Packages zijn allemaal een onderdeel van een library. De standaard library is `work`. Je kan de library simpel vervangen door in Vivado bij de sources naar libraries te gaan, je package hier selecteren en rechtermuisknop te drukken. Kies daarna 'Set Library'. Zet hier de naam van je library.

Om packages die uit een andere library komen te gebruiken moet je volgende lijnen code toe voegen bovenaan je vhdl bestand:
```vhdl
library MyLibrary;
use MyLibrary.MyPackage.ALL;
```
