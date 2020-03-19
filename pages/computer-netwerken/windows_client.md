## Er wordt nog aan dit vak gewerkt!
De inhoud van dit vak wordt nog aangevuld en is dus niet compleet.  
Meehelpen kan, ga naar [Meewerken](/meewerken) voor meer informatie.
# Windows Client
## Disk Management
* Partitie verkleinen: shrink volume
* Partitie uitbreiden: extend volume
* Partitie toevoegen: new simple volume  
Als een partitie corrupted is kan deze gecontroleerd worden in cmd, bv:
`chkdsk d: /r` voor de d schijf.

## Veranderen van IP instellingen
(⊞ staat voor de windows toets, RMB voor rechterklik)  
* Ga naar Network Connections (⊞+X) > RMB op Ethernet0 > Properties
* Selecteer 'Internet Protocol Version 4 (TCP/IPv4)' > Properties  
Om op het internet te geraken, is 'Obtain IP adress automatically' het makkelijkst. Zorg voor NAT/Bridged in VM settings (Ctrl+D).  
Anders: 'Use the following IP adress'.  
* Controleer via cmd: `ipconfig`

## Connecteren van VM's zonder router
Zorg dat de VM's in hetzelfde netwerk zitten: AND( IP, SNM ) moet hetzelfde geven (zie theorie).  
VM's op dezelfde host? Zorg dat de VM's op eenzelfde VMnet zitten.  
VM's op verschillende host? Zorg dat de VM's op Bridged staan en de hosts op hetzelfde netwerk zitten (eventueel rechtstreeks aan elkaar).  
Problemen? Check firewalls, controleer IP via cmd.  
Controleer door naar elkaar te pingen via cmd: `ping <destination IP>`.

## Connecteren van VM's met router
### Fysiek in het labo
Plug de hosts in het US1a netwerk (onthoud de poorten).
Ga naar de router, verbind de corresponderende poorten aan de router.  
De router zal meerdere netwerken verbinden en functioneert voor elk netwerk als de default gateway (DGW). Onthoud aan welk netwerk elke host hangt.
Stel IP-instellingen in: zorg dat de hosts in het juiste netwerk met de juiste DGW zitten.  
Kijk na dat de hosts in 'Bridged' staan.

### Virtueel met VM monowall router
Download de 'monowall router 1 lab' van Blackboard.  
Open ze als VM via VMware Player.  
De router heeft standaard een netwerkkaart in VMnet2. Gebruikt voor dit netwerk DGW 192.168.1.1 en voor de host een IP dat tot dit netwerk behoort. Stel de VM in op VMnet2.  
De andere netwerkkaart van de router hangt in VMnet3 en vormt 192.168.3.1 als DGW. Pas hier dus het IP van de 2de host aan aan en steek ze in VMnet3.

Problemen? Check firewalls, controleer IP via cmd.  
Controleer door naar elkaar te pingen via cmd: `ping <destination IP>`.
