:- dynamic fournisseurs/2.

ponderation(prix,           4).
ponderation(qualite,        5).
ponderation(delais,         4).
ponderation(disponibilite,  4).

reponsePrix(fournisseur1, 2).
reponseQualite(fournisseur1, 4).
reponseDelais(fournisseur1, 5).
reponseDisponibilite(fournisseur1, 4).

reponsePrix(fournisseur2, 1).
reponseQualite(fournisseur2, 4).
reponseDelais(fournisseur2, 3).
reponseDisponibilite(fournisseur2, 2).

reponsePrix(fournisseur3, 5).
reponseQualite(fournisseur3, 3).
reponseDelais(fournisseur3, 4).
reponseDisponibilite(fournisseur3, 3).

fournisseur(fournisseur1,1).
fournisseur(fournisseur2,2).
fournisseur(fournisseur3,3).

% Ajouter un élève à la base de connaissances
ajouter_fournisseur(NomF, Score) :-
    assert(fournisseurs(NomF, Score)).


total_pondere(F, TP) :-
    ponderation(prix, Pp),
    reponsePrix(F, Prix),
    ponderation(qualite, Pq),
    reponseQualite(F, Qual),
    ponderation(delais, Pd),
    reponseDelais(F, Delais),
    ponderation(disponibilite, Pdisp),
    reponseDisponibilite(F, Disp),
    TP is Pp * Prix + Pq * Qual + Pd * Delais + Pdisp * Disp,
    ajouter_fournisseur(F,TP).

decision(Fbest, BestScore) :-
    fournisseur(F, ID),total_pondere(F, Score),
    fournisseurs(Fbest, BestScore),
    \+ ( fournisseurs(_, Score2),
         Score2 > BestScore
       ).


% la longeur de la liste est la longueur de la liste
length([],0).
length([_|T],N) :- length(T,N1), N is N1 + 1.

% nombre element de liste pair 
pair(L) :-
    length(L, N),
    0 is N mod 2.
