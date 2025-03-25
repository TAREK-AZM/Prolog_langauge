bird(snuffy).
dog(bonzo).


pet(Animal):- bird(Animal).
hairy(Animal):- dog(Animal).




% ["C:/Users/AL AZAMI/Desktop/pro_alami/prolog/learning_prolog/basics/checking_data.pl"]

/* test the the code above */
/*
36 ?- bird(snuffy).
true.

37 ?- bird(tarek).  
false.

38 ?- bird(A).
A = snuffy.

39 ?- pet(snuffy).
true.

40 ?- pet(A).      
A = snuffy.

41 ?- pet(bonzo). 
false.

why giting false?
pet(BirdOrDog) binds BirdOrDog to snuffy (the only pet).

Then hairy(snuffy) fails because snuffy is not a dog.
44 ?- pet(BirdOrDog),hairy(BirdOrDog).  
false.

=====Note!!!!! ======
47 ?- X=2, X=1+1.
false.

48 ?- X is 2, X is 1+1. 
X = 2.

*/