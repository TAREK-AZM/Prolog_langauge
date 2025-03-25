# Si A est supérieur à B, la liste est vide.

listenumero(A, B, []) :-
    A > B.
listenumero(A, B, [A|Rest]) :-
    A =< B,
    Next is A + 1,
    listenumero(Next, B, Rest).
