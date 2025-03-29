
/******************************************
  Exemple d’utilisation :
  
  % appell cette function pour trouver le meilleur freelancer
  ?- bestFreelancer(Qualifie, Score).
  
  % le resultat est :
  % compilation :  true.
  7 ?- ["C:/Users/AL AZAMI/Desktop/pro_alami/prolog/cc-correction/EX1_find_best_freelancer.pl"].

    true.

% le meilleur freelancer est f3 avec un score de 76:

    7 ?- bestFreelancer(Qualifie, Score).
    Qualifie = f3,
    Score = 76.

    true.
*******************************************/





/******************************************
  1. Déclarations dynamiques et prédicats 
*******************************************/

% On déclare que freelancersAndScores/2 pourra être modifié dynamiquement.
:- dynamic freelancersAndScores/2.

% Pondérations associées à chaque critère.
pondication(cout,         2).
pondication(competence,   4).
pondication(rep,          3).
pondication(disponible,   3).
pondication(communication,1).

/******************************************
  2. Base de faits : freelancers
     freelancer(Nom, Cout, Competence, Rep, Dispo, RessPers).
*******************************************/

freelancer(f1, 9, 6, 3, 3, 8).
freelancer(f2, 7, 3, 4, 7, 4).
freelancer(f3, 7, 5, 6, 7, 3).
% Vous pouvez en ajouter d’autres si besoin :
% freelancer(f4, ..., ..., ..., ..., ...).

/******************************************
  3. Calcul du score “pondéré” d’un freelancer
*******************************************/

% calculerTotal(+Freelancer, -ScorePondere)
% Calcule la somme pondérée des critères pour un freelancer donné.
calculerTotal(F, Score) :-
    freelancer(F, Cout, Comp, Rep, Dispo, Ress),
    pondication(cout,         PCout),
    pondication(competence,   PComp),
    pondication(rep,          PRep),
    pondication(disponible,   PDispo),
    pondication(communication,PComm),
    Score is Cout * PCout
           + Comp * PComp
           + Rep  * PRep
           + Dispo * PDispo
           + Ress * PComm.

/******************************************
  4. Ajout dans la liste freelancersAndScores
*******************************************/

% ajouterFreelancer(+F, +Score)
% Insère un (freelancer, score) dans la base dynamique freelancersAndScores/2.
ajouterFreelancer(F, Score) :-
    asserta(freelancersAndScores(F, Score)).

/******************************************
  5. Calcul des scores pour tous les freelances 
     et mise à jour de freelancersAndScores
*******************************************/

% calculerScores
% Pour chaque freelancer, calcule le total et l’ajoute dans freelancersAndScores.
calculerScores :-
    freelancer(F, _, _, _, _, _),
    calculerTotal(F, S),
    ajouterFreelancer(F, S),
    fail ; true.

/******************************************
  6. Recherche du meilleur freelancer
*******************************************/

% bestFreelancer(-NomMeilleur, -ScoreMeilleur)
% Vérifie pour un freelancer stocké qu'il n'existe personne avec un score plus élevé.
bestFreelancer(FBest, BestScore) :-
    % 1) On commence par calcul des scores pour tous les freelancers.
    calculerScores,
    % 2) On cherche le meilleur freelancer (avec le score le plus élevé).
    freelancersAndScores(FBest, BestScore),
    \+ (
        freelancersAndScores(_, AutreScore),
        AutreScore > BestScore
    ),
    !.


