<!--
{"indexdepth":1}
-->
# Lab 2 - Reinforcement Learning

## Introductie

Dit deel van de wiki gaat over de opdrachten van lab 2 (practicumsessies 3 & 4).

[Opgave](https://inst.eecs.berkeley.edu/~cs188/fa18/project3.html)

Gelieve de opgaven steeds in volgorde uit te voeren, aangezien deze soms gebruikmaken van vorige opgaven.

### MDP

<!---Geen idee of dit goed is, inhoud ook zeker nakijken aub--->

MDP staat voor Markov Decision Process en komt overeen met `problem` van lab1. Het enige verschil is dat de agent niet altijd de move doet die hem gegeven is. Het kan zijn dat hij 80% van de tijd wél doet wa hij moet doen en 20% van de tijd de verkeerde kant opgaat. Hier zal dus ook rekening mee gehouden moeten in het algoritme.

Handige functies:
* mdp.getStates()
    * Returnt alle mogelijke states in het probleem
* mdp.getPossibleActions(state)
    * Returnt alle mogelijke acties die kunnen uitgevoerd worden door de actor in `state`
* mdp.getTransitionStatesAndProbs(state, action)
    * Returnt een lijst van tuples met de nieuwe state en de kans dat je in die state komt als je `action` wou uitvoeren vanuit `state`
* mdp.getReward(state, action, nextState)
    * Geeft de reward van de actie
* mdp.isTerminal()
    * Boolean die laat weten of je in een terminal state bent

## Opgave 1

$$
V_{k+1}\left(s\right) \leftarrow  \max_{a} \sum_{s'}{T\left(s,a,s'\right)\left[ R\left(s,a,s'\right) + \gamma V_{k}\left(s'\right) \right]} 
$$

In deze opgave moet je `ValueIterationAgent()` afwerken, zodat de values worden bepaald voor de kaart.

Je kan best beginnen bij `runValueIteration()`, daar moet je bovenstaande formule implementeren.

Als dat in orde is, moet je nog twee functies afwerken: 
* `computeActionFromValues(state)`: bepaalt de te nemen actie op basis van values
* `computeQValueFromValues(state, action)`: returnt de Q-waarde adhv de values

De volgende commando's zullen 3 schermen tonen waar je tussen kan switchen door op een toets te duwen.

<img height="400px" src="/media/ai/lab2/values.jpg" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

Hier kan je de values zien per vakje. De pijltjes zijn het resultaat van de `computeActionFromValues`

<img height="400px" src="/media/ai/lab2/qval.jpg" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

Als je dan op een toets duwt, krijg je de Q-waarden.

Het laatste scherm zal de agent tonen terwijl hij het probleem oplost met de gekende data.

### Commando's om te zien of alles werkt

```
python gridworld.py -a value -i 100 -k 10
python gridworld.py -a value -i 5
python autograder.py -q q1
```

### Een aantal tips

#### Volg de formule

Voor `runValueIteration()` moet je gewoon de formule implementeren. Hieronder staat deze in pseudocode:

```
We doen iets self.iterations keer

    We kijken in alle states
        Voor elke mogelijke move gaan we de som maken van alle states en transities waar we in geraken

        Stel het maximum van voorgaande sommen gelijk aan de state waar we mee bezig zijn in een tijdelijke counter
    
    Zet de tijdelijke Counter gelijk aan self.values
```

#### Qvalue

Om de Q-value te bepalen vanuit de values, kan je gebruik maken van volgende formule:
$$
Q\left(s,a\right)= \sum_{s'}{P\left(s'|s,a\right)\left[R\left(s,a, s'\right) + \gamma V\left(s'\right)\right]}
$$

## Opgave 2

Voor je aan deze opgave begint, moet opgave 1 werken.

<img src="/media/ai/lab2/bridge.jpg" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

Dit is een brug, de eindwaarden 1 en 10 zijn de uiteindes, de -100 zijn de afgrond en 0 is de brug zelf. De bedoeling is nu om je netgeschreven functies te gebruiken om de agent over de brug te sturen door één van deze twee waardes aan te passen (discount of noise).

De uiteindelijke waarde moet je in `question2()` in `analasys.py` zetten zodat de autograder deze kan gebruiken.

Even opfrissen:
* Discount: hoeveel elke stap minder waard wordt over tijd
* Noise: hoe groot de kans is dat de agent niet in de richting gaat waarin hij wou gaan

### Commando's om te zien of alles werkt

```
python gridworld.py -a value -i 100 -g BridgeGrid --discount 0.9 --noise 0.2
python autograder.py -q q2
```

## Opgave 3

Voor je aan deze opgave begint, moet opgave 1 werken.

<img src="/media/ai/lab2/discountgrid.png" style="box-shadow: 0 0 10px rgba(0,0,0,0.1);">

Ook hier zal je waarden moeten aanpassen om de agent te overtuigen om bepaalde routes te nemen. Dit zal je ook in `analasys.py` moeten doen. Hier kan je naast diiscount en noise ook livingreward aanpassen (de agent krijgt deze punten voor elke stap dat deze in leven is)
1. De agent gaat naar de dichte uitgang, langs de klif.
2. De agent gaat naar de dichte uitgang, maar niet langs de klif.
3. De agent gaat naar de verre uitgang, langs de klif.
4. De agent gaat naar de veere uitgang, maar niet langs de klif.
5. Blijft voor altijd bovenaan in het bord rondgaan.

### Commando's om te zien of alles werkt

```
python autograder.py -q q3
```

De autograder is het enige commando dat gebruikt kan worden om te testen of je oplossing juist is. Als alles in orde is, zal dit er staan met x de vraag die in orde is.

`*** PASS: test_cases\q3\1-question-3.x.test`

Indien er iets niet in orde is, zal er gezegd worden wat er fout gaat en welk pad de agent neemt.

## Opgave 6

