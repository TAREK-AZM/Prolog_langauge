% Les valeurs possibles pour chaque liquide sont : poison ou safe.

solve(Red, Orange, Yellow, Green, Blue, Violet) :-
    % Contrainte additionnelle : la bouteille rouge n'est pas toxique.
    Red = safe,
    
    % Contrainte (b) : dans le couple (rouge, jaune), il y a exactement un poison.
    % Comme Red = safe, alors Yellow doit être poison.
    Yellow = poison,
    
    % Contrainte (a) : dans le couple (violet, bleu), il y a exactement un poison.
    % On va donc considérer deux cas possibles.
    ( Violet = poison, Blue = safe
    ; Violet = safe,  Blue = poison ),
    
    % Contrainte (c) : dans le couple (bleu, orange), il y a exactement un poison.
    ( Blue = poison, Orange = safe
    ; Blue = safe,  Orange = poison ),
    
    % Contrainte (d) : dans le couple (violet, jaune), il y a au moins une bouteille safe.
    % Or, Yellow = poison, donc Violet doit être safe.
    Violet = safe,
    
    % Contrainte (e) : dans le couple (rouge, orange), il y a au moins une bouteille safe.
    % Red est déjà safe, donc cette contrainte est satisfaite.
    
    % Contrainte (f) : dans le couple (vert, bleu), il y a au moins une bouteille safe.
    % Puisque Blue sera déterminé ci-dessous, si Blue = poison, alors Green doit être safe.
    ( Blue = poison -> Green = safe ; true ).
    
    % Par ailleurs, pour respecter (c) et (a), 
    % si Violet est forcé à safe (voir contrainte d)), alors dans (a) Blue doit être poison,
    % et dans (c) alors Orange doit être safe. De plus, (f) impose alors Green = safe.
