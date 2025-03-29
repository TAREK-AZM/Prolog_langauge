% On définit un prédicat auxiliaire pour l'ordre des jours
day_order(lundi, 1).
day_order(mercredi, 2).
day_order(vendredi, 3).

% Le prédicat solve/3 établit la correspondance pour les trois enseignants.
% Chaque enseignant est représenté par un terme teacher(Nom, Matière, Jour).
% Les matières possibles sont: logique, programmation et mathematiques.
% Les jours possibles sont: lundi, mercredi et vendredi.
solve(Saiida, Mohamed, Khaled) :-
    % Attribution d'une permutation des matières aux trois enseignants.
    permutation([logique, programmation, mathematiques], [SaiidaSubj, MohamedSubj, KhaledSubj]),
    % Attribution d'une permutation des jours aux trois enseignants.
    permutation([lundi, mercredi, vendredi], [SaiidaDay, MohamedDay, KhaledDay]),
    
    % Construction des faits pour chaque enseignant.
    Saiida   = teacher(saiida,   SaiidaSubj,   SaiidaDay),
    Mohamed  = teacher(mohamed,  MohamedSubj,  MohamedDay),
    Khaled   = teacher(khaled,   KhaledSubj,   KhaledDay),

    % Contrainte 1 : La classe de programmation, donnée par saiida, est après celle de logique.
    % → Saiida enseigne la programmation.
    SaiidaSubj = programmation,
    % On détermine qui enseigne la logique et on récupère son jour.
    memberchk(teacher(_, logique, LogicDay), [Saiida, Mohamed, Khaled]),
    % La logique n'est pas enseignée le lundi.
    LogicDay \= lundi,
    % La journée de programmation (SaiidaDay) doit venir après celle de logique.
    day_order(LogicDay, OrderLogic),
    day_order(SaiidaDay, OrderProg),
    OrderProg > OrderLogic,

    % Contrainte 2 : Khaled n'aime pas travailler le lundi.
    KhaledDay \= lundi.
