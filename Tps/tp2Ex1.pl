% Définition du prédicat solve/4 qui attribue à chaque femme un métier parmi :
% mode (créateur de mode), fleuriste, jardinier et orchestre (directeur d’orchestre).

solve(Clara, Luisa, Maria, Nelida) :-
    % Attribution d'une permutation des métiers aux quatre femmes.
    permutation([Clara, Luisa, Maria, Nelida],
                [mode, fleuriste, jardinier, orchestre]),

    % Contrainte (a) : Clara est allergique aux plantes
    % → Elle ne peut pas être fleuriste ni jardinier.
    Clara \= fleuriste,
    Clara \= jardinier,

    % Contrainte (b) : Luisa et le fleuriste travaillent dans le même département
    % → Luisa n'est pas le fleuriste.
    Luisa \= fleuriste,

    % Contrainte (d) : Le jardinier, le couturier (ici "mode") et Nélida ne se connaissent pas.
    % → Nélida ne peut pas être jardinier ni créateur de mode.
    Nelida \= jardinier,
    Nelida \= mode.
