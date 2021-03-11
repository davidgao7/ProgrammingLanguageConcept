evenSum([],0).
evenSum([H|T],Sum):-
    0 is mod(H,2),
    evenSum(T,SumT),
    Sum is H + SumT.
evenSum([H|T],Sum):-
    1 is mod(H,2),
    evenSum(T,Sum).
