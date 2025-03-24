% Family Relations Database
% Author: AL AZAMI
% Date: 2024

/*
Defines father relationships:
- abdolilah is the father of tarek
- abdelslam is the father of abdolilah
*/
father(abdolilah, tarek).
father(abdelslam, abdolilah).

% Defines mother relationships:
mother(farida,wissam).
mother(farida, tarek).
mother(farida,mourad).

% Parent rule: X is a parent of Y if X is either father or mother of Y
parent(X, Y) :- father(X, Y).  % Father case
parent(X, Y) :- mother(X, Y).   % Mother case

/*
Grandparent rule:
X is a grandparent of Y if:
- Z is a parent of Y, and
- X is a parent of Z
*/
grandparent(X, Y) :- parent(Z, Y), parent(X, Z).


% ancestor implementation
ancestor(X, Y) :- parent(X, Y).

ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
