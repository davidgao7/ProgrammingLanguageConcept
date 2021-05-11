mystery([]):-!.
mystery(A):-
  length(A,1),
  !.

mystery([B|C]):-
  helper(C,B),
  helper2(C,D),
  mystery(D).

helper([E],E):-!.
helper([_|F],G):-
  helper(F,G).

helper2([_],[]):-!.
helper2([J|K],[J|M]):-
  helper2(K,M).
