# Moorovi avtomati

Projekt vsebuje implementacijo Moorovih avtomatov in njihovo uporabo pri avtomatu za pobiranje cestnine.

TODO

## Matematična definicija

Moorov avtomat je definiran kot nabor $(\Sigma, \Gamma, Q, q_0, \delta, \gamma)$, kjer so:

- $\Sigma$ abeceda vhodov,
- $\Gamma$ abeceda izhodov,
- $Q$ množica stanj,
- $q_0 \in Q$ začetno stanje,
- $\delta : Q \times \Sigma \to Q$ prehodna funkcija,
- $\gamma : Q \to \Gamma$ funkcija, ki stanja slika v abecedo izhodov (izhodna funkcija).

## Primer

V primeru avtomata za pobiranje cestnine, lahko avtomat opišemo na sledeč način.
Naj bo cestnina 1 €. Avtomat sprejema kovance: 1 cent, 2 centa, 5 centov, 10 centov, 20 centov in 50 centov.

- $\Sigma$ : množica vseh različnih kovancev, ki jih avtomat sprejema,
- $\Gamma$ : dvigovanje rampe, pobiranje cestnine,
- $Q$ : akumulirana količina denarja,
- $q_0$ : 0 €,
- $\delta : Q \times \Sigma \to Q$ : na podlagi vhoda določi prehod med stanji,
- $\gamma : Q \to \Gamma$ : določa izhod na podlagi trenutnega stanja.


## Navodila za uporabo


## Struktura datotek

TODO


### Viri
- https://en.wikipedia.org/wiki/Moore_machine
- https://github.com/matijapretnar/programiranje-1/tree/master/projekt