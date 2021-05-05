%delete every 4th element in list
num(4).
num(3).
num(2).
num(1).

mystery(In, Out):-
  num(Number),
  !,
  helper(In,Number,Out).

helper(A,N,B):-
  num(N),
  length(A,LA),
  LA < N,%keep redo and incresing size of list A
  A = B,% is string list less than 4, return itself
  !.

helper(A,N,B):-
  num(N),
  P is N - 1,
  assistant(A,P,C),
  apprentice(A,N,D),
  helper(D,N,E),
  append(C,E,B).

assistant(_,0,[]):-!.
assistant([A|B], N, [A|C]):-
  num(N),
  P is N - 1,
  assistant(B, P, C).

apprentice(A,0,A):-!.
apprentice([_], 1, []):-!.
apprentice([_|A], N, B):-
  num(N),
  P is N - 1,
  apprentice(A,P,B).
