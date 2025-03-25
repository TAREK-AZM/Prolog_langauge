borne(L) :-
    length(L, N),
    borne_elements(L, N).

borne_elements([], _).
borne_elements([H|T], N) :-
    H < N,
    borne_elements(T, N).
