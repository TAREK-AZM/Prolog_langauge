mother(jane,jim).
mother(sausan,fred).
mother(jane,nora).

sibling(Chl1,Chl2) :- mother(Mum,Chl1), mother(Mum,Chl2).



% test the code above


% ["C:/Users/AL AZAMI/Desktop/pro_alami/prolog/learning_prolog/basics/siblings.pl"]


% testing sibling

/*
63 ?- sibling(jim,Who).  
Who = jim ;
Who = nora.
========= how to get fred? ========
62 ?- sibling(Who,fred).
Who = fred ;
false.

Step-by-Step Execution of sibling(jim, Who)
    First Goal: mother(Mum, jim)

    Matches mother(jane, jim) → Mum = jane (Jim's mother is Jane).

Second Goal: mother(jane, Who)

    Prolog searches for all children of jane in the database:

    mother(jane, jim) → Who = jim (Jim is technically his own sibling)

    mother(jane, nora) → Who = nora (Nora is Jim's sibling)

Results:

    First solution: Who = jim (from mother(jane, jim)).

    Second solution: Who = nora (from mother(jane, nora)).

    No more matches → returns false. after all solutions are exhausted.
========================================================================
Step-by-Step Execution of |====> sibling(Who, fred) <=====|
First Goal: mother(Mum, Who)

Prolog searches the database top-to-bottom for matches:

    mother(jane, jim) → Mum = jane, Who = jim

    mother(sausan, fred) → Mum = sausan, Who = fred

    mother(jane, nora) → Mum = jane, Who = nora

Second Goal: For each Mum found, check mother(Mum, fred)

    If Who = jim (from Mum = jane):

    Is mother(jane, fred) true? No → Backtrack (discard this path).

    If Who = fred (from Mum = sausan):

    Is mother(sausan, fred) true? Yes → Keep solution (Who = fred).

    If Who = nora (from Mum = jane):

    Is mother(jane, fred) true? No → Backtrack.

Result: Only Who = fred satisfies both goals.

*/