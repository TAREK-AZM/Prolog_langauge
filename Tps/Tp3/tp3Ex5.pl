#  Cas de base : une liste vide ou à un seul élément est considérée comme ayant tous ses éléments égaux.
tous_egaux([]).
tous_egaux([_]).
tous_egaux([X, Y | T]) :-
    X = Y,
    tous_egaux([Y | T]).
