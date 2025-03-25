#  Une liste vide est ordonnée.
ordered([]).
ordered([_]).

ordered([X, Y | T]) :-
    X =< Y,
    ordered([Y | T]).
