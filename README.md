# Moorovi avtomati

Projekt vsebuje implementacijo Moorovih avtomatov in njihovo uporabo pri avtomatu za pobiranje cestnine.

## Matematična definicija

Moorov avtomat je definiran kot nabor $(\Sigma, \Gamma, Q, q_0, \delta, \gamma)$, kjer so:

- $\Sigma$ abeceda vhodov,
- $\Gamma$ abeceda izhodov,
- $Q$ množica stanj,
- $q_0 \in Q$ začetno stanje,
- $\delta : Q \times \Sigma \to Q$ prehodna funkcija,
- $\gamma : Q \to \Gamma$ izhodna funkcija.

## Primer

V primeru avtomata za pobiranje cestnine, lahko avtomat opišemo na sledeč način.
Naj bo cestnina 5 evrov. Avtomat sprejema kovance po en in dva evra.

- $\Sigma$ = {0, 1, 2},
- $\Gamma$ = {"Dodaj 1.", "Dodaj 2.", "Dodaj 3.", "Dodaj 4.", "Dodaj 5.", "Dvigovanje rampe."}
- $Q = \{q_0, q_1, q_2, q_3, q_4, q_5\}$, kjer indeks predstavlja količino akumuliranega denarja,
- $q_0 = q_0$,
- $\delta : Q \times \Sigma \to Q$ :
podana z naslednjo tabelo

    | $\delta$ | `0`   | `1`   | `2`   |
    | -------- | ----- | ----- | ----- |
    | $q_0$    | $q_0$ | $q_1$ | $q_2$ |
    | $q_1$    | $q_1$ | $q_2$ | $q_3$ |
    | $q_2$    | $q_2$ | $q_3$ | $q_4$ |
    | $q_3$    | $q_3$ | $q_4$ | $q_5$ |
    | $q_4$    | $q_4$ | $q_5$ | $q_5$ |
    | $q_5$    | $q_5$ | $q_5$ | $q_5$ |


- $\gamma : Q \to \Gamma$ : opišemo z relacijo: {($q_0$, "Dodaj 5."), ($q_1$, "Dodaj 4."), ($q_2$, "Dodaj 3."), ($q_3$, "Dodaj 2."), ($q_4$, "Dodaj 1."), ($q_5$, "Odpiranje rampe.")}.


## Navodila za uporabo

Tekstovni vmesnik prevedemo z ukazom `dune build`, ki ustvari datoteko `tekstovniVmesnik.exe`. Potem v terminal napišemo še ukaz `./tekstovniVmesnik.exe`, ki datoteko požene.

## Struktura datotek

Projekt je sestavljen iz mape `src`, ki vsebuje mapi `definicije` in `tekstovniVmesnik`.
Prva vsebuje datoteke za implementacijo avtomata, druga pa implementacijo teksotovnega vmesnika.

### Viri
- https://en.wikipedia.org/wiki/Moore_machine
- https://github.com/matijapretnar/programiranje-1/tree/master/projekt
