#  Prédicat pour inverser une liste.
reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, RT),
    append(RT, [H], R).

palindrome(L) :-
    reverse_list(L, L).
