% verifie si un element dans la tete de la liste
existEnTete(X,[X|_]).

% longeur de la liste
longeur([],0).
longeur([_|Qeue],N):-  longeur(Qeue,N1),N is N1+1.

% concatination deux listes:

merge([],L,L).
merge([X|L1],L2,[X|L3]):-
	 merge(L1,L2,L3).

ajouter(X,L,[X|L]).


% toul les elements de la liste sont egaux
all_equal([]).               % Empty list is trivially true
all_equal([_]).              % Single-element list is true
all_equal([X, X | Rest]) :-  % First two elements MUST unify
    all_equal([X | Rest]).    % Recurse on the rest


% changer elements deux listes
% Cas de base : deux listes vides .
echange([], [], [], []).

% Cas récursif : on échange la tête de chaque liste et on continue sur les queues.
echange([X|Xs], [Y|Ys], [Y|Rxs], [X|Rys]) :-
    echange(Xs, Ys, Rxs, Rys).
