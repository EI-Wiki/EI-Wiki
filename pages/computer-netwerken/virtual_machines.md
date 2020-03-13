# Er wordt nog aan dit vak gewerkt!
De inhoud van dit vak wordt nog aangevuld en is dus niet compleet.  
Meehelpen kan, ga naar [Meewerken](/meewerken) voor meer informatie.
# Virtual Machines
## Creëren van een virtual machine
1. VmWare Player: klik op "Create New Virtual Machine". 
2. Kies: "I will install OS later".  
    Kies: "microsoft Windows" en "Windows 10 x64".
3. Geef een logische naam op, bv.: vm1feb2020.   
    Geef het pad naar de map waar de VM's zullen staan (maak deze eventueel aan).  
    VM's nemen snel veel geheugen in, zorg voor genoeg ruimte.  
    Zorg dat er geen spaties staan in dit pad (bv. '...\computer_netwerken...' i.p.v. '...\computer netwerken...')  
     Vergeet niet de VM in een (nieuwe) eigen map te steken zodat al haar bestanden in 1 map zitten.
4. Verander de max. grootte van de vm's harde schijf: 10-20GB.  
    Kies: "store virtual disk as single file"  
5. Klik op finish.
6. Rechterklik in VmWare Player op de VM, kies settings.
7. Bij CD/DVD/SATA, kies: "use iso image file".
    Verwijs hiervoor naar de locatie van je w10 90d iso-file (online zijn er 90 dagen trial versies van windows 10 te vinden)
8. Start de VM op.  
    Druk op een toets als dit wordt gevraagd.  
    Als dit niet wordt gevraagd, start de VM opnieuw op en spam tijdens het opstarten op een toets (dit kan meerdere pogingen vragen).
9. Volg dan de windows installatie.  
    Taal: english-US  
    Keyboard: 'belgian period' = azerty, 'US internat.' = qwerty.  
    Klik: "Install Now".  
    Accepteer de eula.
    Kies: "Custom Installation"
    Klik op "Next".  
    Volg de installatie en beantwoord de vragen.  
    Gebruik geen microsoft account, maar kies (linksbeneden) "domain join instead"  
    Als gebruiker: "adm-w10" (dit is de admin).  
    Als wachtwoord: "pw".  
    Vul de vragen zo gemakkelijk mogelijk in.  
    Volg de rest van de installatie. 
10. Verander de naam van de PC. 
    Rechterklik op "This PC" in verkenner > propreties.  
    Naast de naam: "change settings".
    (Pas description aan)
    Naast "rename this computer..." > "change".  
11. Verander eventueel nog de settings van de VM:  
    * 2048 MB RAM
    * Network adapter: "bridged".  
    Klik "configure adapters" en zorg dat alleen de echte networkadapter is aangevinkt.

TIP: zorg dat je steeds een 'clean copy' VM hebt zodat je deze kan kopiëren en niet steeds heel dit proces moet herhalen

## Kopiëren van een virtual machine
1. Kopiëer de map van de VM.
2. Verander de naam van de map.
3. Klik in VmWare Player op "Open Virtual Machine" en navigeer naar de (nieuwe) map waar de gekopiëerde VM staat en selecteer de VM (naam.vmx).
4. BELANGRIJK: Start dan de VM op en selecteer "I copied it" wanneer men vraagt waar deze VM vandaan komt.  
Deze stap is zeer belangrijk want anders heeft de nieuwe VM hetzelde MAC-adres als de oude.

## VM network adapter instellingen
* Bridged: De VM gedraagt zich als een aparte PC op het netwerk met een eigen IP etc. De VM kan dus net als een normale PC op het internet als het netwerk hieraan verbonden ligt en de VM een IP binnen het netwerk of een automatisch IP gebruikt.
* NAT: De VM deelt de netwerk instellingen van de host. In feite wordt er een virtueel privaat netwerk met de host als router opgezet waaraan de VM hangt. Langs buiten zien de host en de VM er uit als 1 identiteit.  
De VM kan met het externe netwerk verbinden en dus internet gebruiken met de juiste IP instellingen. Bij default kunnen sytemen op het externe netwerk geen directe verbinding initiëren met de VM (bv. webpaginas hosten vanop de VM gaat dan niet).
* Host-only: De host maakt binnenin een virtueel privaat netwerk (VPN) aan waarmee de VM's met Host-only setting verbonden zijn. VM's op deze VPN zijn normaal onzichtbaar voor systemen op de buitenwereld en kunnen hiermee dus standaard niet communiceren.
* Custom: De VM is verbonden met een VMnet. Dit is een soort virtuele switch waar alle andere VM's in hetzelfde VMnet mee verbonden zijn. De connectie van deze switch met de host/extern netwerk kan apart ingesteld worden.  
Standaard is VMnet1 Host-Only geconfigureerd en VMnet8 NAT.
* LAN segment: De VM hangt aan een LAN samen met andere VM's met dezelfde instelling. In tegenstelling tot de Host-Only en NAT instelling werkt de host niet als DHCP en zal de VM geen automatisch IP binnen het netwerk krijgen.  
De LAN is gescheiden van het externe netwerk/internet en kan hiermee niet communiceren.