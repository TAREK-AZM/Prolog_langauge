/******************************************
  Exemple d’utilisation :
  
  % appell cette function pour échanger deux listes de même longueur
  ?- echange(Liste1, Liste2, Liste3, Liste4).
  
  % le resultat est :
  17 ?- ["C:/Users/AL AZAMI/Desktop/pro_alami/prolog/cc-correction/EX2_echange_deux_listes.pl"].
    true.

    18 ?- echange([1,2,3,4,5],[6,7,8,9,10],L2,L1).   
    L2 = [6, 7, 8, 9, 10],
    L1 = [1, 2, 3, 4, 5].
*******************************************/



/******************************************
% Échange tous les éléments de deux listes de meme longueur.
*******************************************/

% Cas de base : deux listes vides donnent deux listes vides.
echange([], [], [], []).

% Cas récursif : on échange les têtes X et Y, puis on traite le reste.
echange([X|RX], [Y|RY], [Y|NRX], [X|NRY]) :-
    echange(RX, RY, NRX, NRY).



