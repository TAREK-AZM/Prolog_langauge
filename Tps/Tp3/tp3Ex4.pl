
#### Union et intersection de deux listes.

#1) Union.
#  Si A est vide, l'union est simplement B.
union([], B, B).

union([H|T], B, R) :-
    member(H, B),!,union(T, B, R).
union([H|T], B, [H|R]) :-
    union(T, B, R).

#) Intersection.
#  Si A est vide, l'union est simplement B.
#  Si A est vide, l'intersection est vide.
inter([], _, []).
inter([H|T], B, [H|R]) :-
    member(H, B),!,inter(T, B, R).
inter([_|T], B, R) :-
    inter(T, B, R).
