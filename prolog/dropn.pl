% drop first n element in List
% dropn(N,ListBefore,ListAfter)
dropN(0,ListBefore,ListBefore).
dropN(_,[],[]).
dropN(N,[_|TB],ListAfter):-
    length([_|TB],LengthBefore),
    between(1,LengthBefore,N),
    NM1 is N - 1,
    dropN(NM1,TB,ListAfter).
