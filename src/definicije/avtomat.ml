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

