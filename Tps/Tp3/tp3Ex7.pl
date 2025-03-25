
#  maximum et minimum d'un list.


max_list([X], X).
max_list([H|Q],Max):- 
    max_list(Q,Max1),
    (H > Max1 -> 
    Max = H 
    ; 
    Max = Max1).

#  minimum d'un list.

min_list([X], X).
min_list([H|Q],Min):- 
    min_list(Q,Min1),
    (H < Min1 -> 
    Min = H 
    ; 
    Min = Min1).


