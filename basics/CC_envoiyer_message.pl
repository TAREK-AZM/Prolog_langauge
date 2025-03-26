/***************************************
   Representation Prolog d’un système 
   de calcul de coûts d’envois
***************************************/
/*
%% Pour plus de clarté, on sépare “tarif_base/4” (les faits) et “tarif/4” (une règle
%% qui autorise l’envoi dans les deux sens).  

%% tarif_base(Origine, Destination, TypeObjet, PrixBase).
%% TypeObjet = lettre | colis
%% PrixBase = coût de base pour un colis (≤ 2 kg) ou une lettre,
%%            quand ce n’est pas “même jour” et pas >2 kg.
*/

tarif_base(madrid,    barcelone, lettre, 700).
tarif_base(madrid,    barcelone, colis,  1200).
tarif_base(madrid,    toledo,    lettre, 300).
tarif_base(madrid,    toledo,    colis,  800).
tarif_base(madrid,    badajoz,   lettre, 500).
tarif_base(madrid,    badajoz,   colis,  1000).

tarif_base(barcelone, cadiz,     lettre, 1000).
tarif_base(barcelone, cadiz,     colis,  1600).
tarif_base(barcelone, gerona,    lettre, 300).
tarif_base(barcelone, gerona,    colis,  800).
tarif_base(barcelone, badajoz,   lettre, 800).
tarif_base(barcelone, badajoz,   colis,  1500).

/*
 Réciprocité : l’envoi A->B a le même tarif que B->A.
 Pour l’utiliser, on définit un prédicat “tarif/4” plus général.
*/

tarif(A, B, Type, Prix) :-
    tarif_base(A, B, Type, Prix).

tarif(A, B, Type, Prix) :-
    tarif_base(B, A, Type, Prix).

/* -------------------------------------------------------------------
   Supplément “même jour”

   On suppose qu’on ajoute +1000 si l’envoi arrive le même jour,
   aussi bien pour les lettres que pour les colis.
   On représente “même jour” par un atome oui ou non.
------------------------------------------------------------------- */

surcharge_meme_jour(oui, 1000).
surcharge_meme_jour(non, 0).

/* -------------------------------------------------------------------
   Supplément “poids” 

   - Pour les lettres, on considère qu’il n’y a pas de supplément,
     quelle que soit la masse.
   - Pour un colis de plus de 2 kg, on ajoute +100 pour chaque gramme 
     excédant 2 kg.  

   On suppose que `Poids` est donné en kilogrammes (ex. 2.7).
   Pour convertir l’excès en grammes : 
     GrammesExc = (Poids - 2) * 1000
     Surplus    = GrammesExc * 100
------------------------------------------------------------------- */

surcharge_poids(lettre, _Poids, 0).  % Jamais de supplément
surcharge_poids(colis, Poids, Surcharge) :-
    (  Poids =< 2
    -> Surcharge = 0
    ;  ExcèsKg  is Poids - 2,
       ExcèsGr  is ExcèsKg * 1000,
       Surcharge is ExcèsGr * 100
    ).

/* -------------------------------------------------------------------
   Calcul final :
   cout_total(Orig, Dest, TypeObj, Poids, MemeJour, Cout)

   1) On obtient le tarif de base (tarif/4) 
   2) On ajoute le supplément “même jour” si MemeJour=oui
   3) On ajoute le supplément “poids” (si colis > 2 kg)
   4) On unifie Cout avec la somme totale
------------------------------------------------------------------- */

cout_total(Orig, Dest, TypeObj, Poids, MemeJour, Cout) :-
    % 1) Tarif de base
    tarif(Orig, Dest, TypeObj, Base),

    % 2) Surcharge m jour
    surcharge_meme_jour(MemeJour, SM),

    % 3) Surcharge “poids” (si c’est un colis > 2kg)
    surcharge_poids(TypeObj, Poids, SP),

    % 4) Somme finale
    Cout is Base + SM + SP.

