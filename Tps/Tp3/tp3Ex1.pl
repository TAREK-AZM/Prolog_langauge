#  Cas de base : si K vaut 1, on supprime la tête de la liste.
remove_kth([_Head|Tail], 1, Tail).

remove_kth([Head|Tail], K, [Head|Rest]) :-
    K > 1,
    K1 is K - 1,
    remove_kth(Tail, K1, Rest).
