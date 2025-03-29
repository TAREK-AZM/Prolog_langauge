


% faire un tp sur les list et les listes

% some

some_list([],0).
  some_list([H|Q],S) :- some_list(Q,S), S is H + S.


% moyenne
moyenne_list(l,moyenne).
    length(l,T), T>0,some_list(L ,some)
        moyenne is some/T.
