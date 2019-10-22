# [EI-Wiki](..)/[Digitale Elektronica](Home)/Vivado
## Waar vind ik wat?
De sources bevinden zich in projectnaam/projectnaam.srcs  
Er worden 3 soorten sources gebruikt:
* Design sources: de code zelf (in vhdl)
	* Deze sources eindigen in .vhd en bevinden zich vaak in de sources_1 folder
* Simultation sources: testbenches enzo (ook in vhdl)
	* Deze sources eindigen in .vhd en bevinden zich vaak in de sim_1 folder.
	* Testbenches worden gebruikt om signalen/poorten een waarde te geven zonder een bordje te moeten gebruiken.
* Constraint sources
	* Deze sources eindigen in .xdc en bevinden zich vaak in de constrs_1 folder.
	* Constraint files worden gebruikt om de pinnetjes van het fysieke bordje te koppelen aan de poorten die je gebruikt in vhdl
	