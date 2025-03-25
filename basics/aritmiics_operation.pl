sum(X,Y,Res) :- Res is X+Y.
sub(X,Y,Res) :- Res is X-Y.
multiple(X,Y,Res) :- Res is X*Y.
divide(X, 0, 'undefined').  % Return 'undefined' for division by zero
divide(X, Y, Res) :- 
   
    Res is X / Y.
% claculate sum of n= n+(n-1)+(n-2)+....+1
sumGeneral(N,Res) :- Res is N*(N+1)/2.

% segma
segma(1,1).
% test the code above

% ["C:/Users/AL AZAMI/Desktop/pro_alami/prolog/learning_prolog/basics/aritmiics_operation.pl"]


/*
1 ?- sum(2,3,Res).
Res = 5.

2 ?- sub(2,3,Res).
Res = 1.

3 ?- multiple(2,3,Res).
Res = 6.

4 ?- divide(2,3,Res).
Res = 0.6666666666666666.

5 ?- sum(2,3,Res), sub(Res,1,Res).
Res = 5,
Res = 1.
*/