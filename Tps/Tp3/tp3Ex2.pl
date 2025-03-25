# Cas de base : la liste vide a 0 élément (pair).
pair([]).

pair([_, _ | Tail]) :-
    pair(Tail).
