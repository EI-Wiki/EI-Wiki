{% include head.html %}
# [EI-Wiki](..)/[Digitale Elektronica](Home)/Vivado
## Waar vind ik wat?
De sources bevinden zich in projectnaam/projectnaam.srcs  
Er worden 3 soorten sources gebruikt:
* Design sources: de code zelf (vhdl)
	* Deze sources eindigen in .vhd en bevinden zich vaak in de sources_1 folder
* Simultation sources: Testbenches (vhdl)
	* Deze sources eindigen in .vhd en bevinden zich vaak in de sim_1 folder.
	* Testbenches worden gebruikt om signalen/poorten een waarde te geven zonder een bordje te moeten gebruiken.
* Constraint sources
	* Deze sources eindigen in .xdc en bevinden zich vaak in de constrs_1 folder.
	* Constraint files worden gebruikt om de pinnetjes van het fysieke bordje te koppelen aan de poorten die je gebruikt in vhdl
* ss

## Hoe voeg ik IP-Blokken(xci bestanden) toe?
Om IP-Blokken toe te voegen aan je project volg de volgende stappen:
1. Creeer een apparte folder voor ELK ip-blok.
	* Je kan deze best in je project plaatsen!

2. Voeg elk ip-blok (xci bestand) toe in je design sources.

3. Druk rechter muisknop op elk van de ip-blokken en kies 'Upgrade IP'.