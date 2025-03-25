% --- 1 PONDÉRATIONS DES CRITÈRES ---
%     On associe à chaque critère un “poids” numérique.
ponderation(prix,           4).
ponderation(qualite,        5).
ponderation(delais,         4).
ponderation(disponibilite,  4).

% --- 2 BASE DE CONNAISSANCES : FOURNISSEURS ---
%     fournisseur(ID, Prix, Qualité, Délais, Disponibilité).
%     Les valeurs sont celles que vous avez relevées (notes de 1 à 5 par exemple).
fournisseur(1, 2, 4, 5, 4).  % Fournisseur 1
fournisseur(2, 1, 4, 3, 2).  % Fournisseur 2
fournisseur(3, 5, 3, 4, 3).  % Fournisseur 3

% --- 3 CALCUL DU TOTAL PONDÉRÉ POUR UN FOURNISSEUR ---
%     total_pondere(ID, Total) est vrai si Total
%     est la somme pondérée des notes de ‘fournisseur(ID, …)’
total_pondere(ID, Total) :-
    fournisseur(ID, Prix, Qual, Delais, Disp),
    ponderation(prix,          Pp),
    ponderation(qualite,       Pq),
    ponderation(delais,        Pd),
    ponderation(disponibilite, Pdisp),
    Total is Prix*Pp + Qual*Pq + Delais*Pd + Disp*Pdisp.

% --- 4 TROUVER LE MEILLEUR FOURNISSEUR ---
%     meilleur_fournisseur(ID_meilleur, ScoreMax)
%     est vrai si ID_meilleur est le fournisseur dont le total pondéré = ScoreMax
meilleur_fournisseur(ID, Max) :-
    % Récupérer tous les scores de tous les fournisseurs
    findall(T, (fournisseur(F,_,_,_,_), total_pondere(F,T)), ListeScores),
    % Trouver le maximum dans la liste
    max_list(ListeScores, Max),
    % Retrouver l’ID du fournisseur qui atteint ce score maximum
    total_pondere(ID, Max).
