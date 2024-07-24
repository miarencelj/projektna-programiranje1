type stanje = Stanje.t

type t = {
  stanja : stanje list;
  zacetno_stanje : stanje;
  prehodi : (stanje * char * stanje) list;
  izhod : (stanje * string) list
}

let prazen_avtomat zacetno_stanje =
  {
    stanja = [ zacetno_stanje ];
    zacetno_stanje;
    prehodi = [];
    izhod = [];
  }

let dodaj_stanje stanje avtomat =
  { avtomat with stanja = stanje :: avtomat.stanja }

let dodaj_prehod stanje1 znak stanje2 avtomat =
  { avtomat with prehodi = (stanje1, znak, stanje2) :: avtomat.prehodi }

let dodaj_izhod stanje izhod avtomat =
  { avtomat with izhod = (stanje, izhod) :: avtomat.izhod }

let prehodna_funkcija avtomat stanje znak =
  match
    List.find_opt
      (fun (stanje1, znak', _stanje2) -> stanje1 = stanje && znak = znak')
      avtomat.prehodi
  with
  | None -> None
  | Some (_, _, stanje2) -> Some stanje2

let izhodna_funkcija avtomat stanje = 
  match
    List.find_opt
      (fun (stanje', _izhod) -> stanje = stanje')
      avtomat.izhod
  with
  | None -> None
  | Some (_, izhod) -> Some izhod

let zacetno_stanje avtomat = avtomat.zacetno_stanje
let seznam_stanj avtomat = avtomat.stanja
let seznam_prehodov avtomat = avtomat.prehodi
let seznam_izhodov avtomat = avtomat.izhod
let cestnina =
  let q0 = Stanje.iz_niza "q0"
  and q1 = Stanje.iz_niza "q1"
  and q2 = Stanje.iz_niza "q2"
  and q3 = Stanje.iz_niza "q3"
  and q4 = Stanje.iz_niza "q4"
  and q5 = Stanje.iz_niza "q5" in
  prazen_avtomat q0
  |> dodaj_stanje q1
  |> dodaj_stanje q2
  |> dodaj_stanje q3
  |> dodaj_stanje q4
  |> dodaj_stanje q5
  |> dodaj_prehod q0 '0' q0
  |> dodaj_prehod q1 '0' q1
  |> dodaj_prehod q2 '0' q2 
  |> dodaj_prehod q3 '0' q3
  |> dodaj_prehod q4 '0' q4
  |> dodaj_prehod q5 '0' q5
  |> dodaj_prehod q0 '1' q1
  |> dodaj_prehod q1 '1' q2
  |> dodaj_prehod q2 '1' q3 
  |> dodaj_prehod q3 '1' q4
  |> dodaj_prehod q4 '1' q5
  |> dodaj_prehod q5 '1' q5
  |> dodaj_prehod q0 '2' q2
  |> dodaj_prehod q1 '2' q3
  |> dodaj_prehod q2 '2' q4
  |> dodaj_prehod q3 '2' q5
  |> dodaj_prehod q4 '2' q5
  |> dodaj_prehod q5 '2' q5
  |> dodaj_izhod q0 "Dodaj 5."
  |> dodaj_izhod q1 "Dodaj 4."
  |> dodaj_izhod q2 "Dodaj 3."
  |> dodaj_izhod q3 "Dodaj 2."
  |> dodaj_izhod q4 "Dodaj 1."
  |> dodaj_izhod q5 "Odpiranje rampe."

let preberi_niz avtomat zacetno_stanje niz =
  let rec aux stanje acc_izhodov vhod =
    match vhod with
    | [] -> stanje, List.rev acc_izhodov
    | znak :: ostalo ->
      match prehodna_funkcija avtomat stanje znak with
      | None -> stanje, List.rev acc_izhodov
      | Some novo_stanje ->
        let izhod = izhodna_funkcija avtomat novo_stanje in
        aux novo_stanje (izhod :: acc_izhodov) ostalo
  in
  aux zacetno_stanje [] (niz |> String.to_seq |> List.of_seq)