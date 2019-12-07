# Meewerken
## Inhoudsopgave
* [Fouten melden](#fouten-melden)
* [Zelf pagina's schrijven](#zelf-pagina-39-s-schrijven)
* [Forken van de wiki](#forken-van-de-wiki)
* [Pull Request](#pull-request)
* [Markdown](#markdown)
    * [Pull Request](#syntax)
    * [Algemene Regels](#algemene-regels)
        * [1. Titels](#1-titels)
        * [2. Foto's Toevoegen](#2-foto-39-s-toevoegen)
        * [3. Links Toevoegen](#3-links-toevoegen)
* [Latex](#latex)

## Fouten melden
Fouten melden kan zeer simpel in de [issues pagina](https://github.com/WatcherWhale/EI-Wiki/issues).
Uw issue wordt nagekeken en daarna verwerkt door de onderhouders of door een pull request.

## Zelf pagina's schrijven
Pagina's schrijven is zeer simpel. Eerst moet je de EI-Wiki [forken](#forken-van-de-wiki). Nadat je dit gedaan hebt kan je op je fork wijzigingen aanbrengen.

Al de pagina's op de EI-Wiki zijn geschreven met pure markdown. Dit is een zeer simplistische markup language. Dit doen we om het bewerken van de wiki simpel en begrijpbaar te houden. Lees meer over [Markdown](#markdown). Er gelden enkele algemene regels voor het maken van pagina's, je kan deze ook terug vinden in de sectie [Markdown](#markdown).

Als je graag wiskundige formules of uitdrukkingen wilt typen op de wiki gaat dat. We doen dit met [latex](#latex).

## Forken van de wiki
Een fork is een git repository die alle code kopieert van de echte repository. Je kan hier dan je eigen wijzigen aanbrengen en daarna een [pull request](#pull-request) maken.

Om de wiki te forken gebruik je deze link: [Fork EI-Wiki](https://github.com/WatcherWhale/EI-Wiki/fork). Je kan de EI-Wiki ook forken foor op de fork knop te drukken op [github](https://github.com/WatcherWhale/EI-Wiki/).

## Pull Request
Een pull request is een request om je gewijzigde code toe te voegen aan de orginele repository. Deze zal dan goedgekeurd worden door de onderhouders.

Elke pull request moet een logische naam bevatten en moet zeker te wijzigen zijn door de onderhouders, bij gebrek van één van deze voorwaarden, wordt de pull request automatisch geweigerd.
Af en toe wordt de pull request niet aanvaard worden en zal een onderhouder een comment plaatsen over wat nog moet gebeuren of aangepast worden, zorg dat deze aanpassingen zo snel mogelijk worden toegepast.

Bij veelvuldig goede pull requests te maken wordt je een vertrouweling en zullen we je waarschijnlijk vragen om deel te worden van het team van onderhouders.

## Markdown
### Syntax
Makdown is een zeer simpele opmaaktaal die zeer leesbaar is. Makdown files hebben altijd de extensie `.md`. Voor een zeer goede markdown guide bekijk zeker één van de volgende pagina's:
* [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

### Algemene Regels
#### 1. Titels
Elke pagina heeft een grote titel titel die volgende structuur heeft:
```md
(Vak)[/vak]/Pagina Titel
```

De andere titels zijn altijd kleiner dan de bovenste.

#### 2. Foto's toevoegen
Om foto's toevoegen gebruik je de img tag van html
```html
<img src="<image url>" class="<image size class>">
```
Zorg er voor dat de image url enkel lowercase letters bevat. Alle images moeten ook opgeslagen worden in de media folder op de git.
Hier is een voorbeeld url:
```
/media/<vak>/<image>.png
```

Hier zijn enkele size classes om de grootte van de afbeelding te bepalen:
* Hoogte: `max-h-100`, `max-h-200`, `max-h-500`
* Breedte: `max-w-100`, `max-w-200`, `max-w-500`

Deze classes werken enkel op de wiki website.

#### 3. Links toevoegen
Elke link moet die naar een andere pagina op de wiki wijst moet met lowercase letters geschreven. Andere links moeten dit niet per noodzaak.

## Latex
Als je een wiskundige formule of uitdrukking wil noteren, kan je dit doen door middel van \\(\LaTeX\\). 

Om een wiskundige formule midden in je regel wilt plaatsen type je eerst `\\(`
Om inline LaTex te typen gebruik je de volgend karakter om de latex formule te starten `\(` en om de formule eidigen `\)`. Voor een grote formule `$$` om te starten en te stoppen.

$$Grote_{Formule}$$
