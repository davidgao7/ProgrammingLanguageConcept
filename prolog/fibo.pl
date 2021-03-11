

fib(0,0).
fib(1,1).
fib(N,FibN):-
    length(_,N),
    N > 1,
    NM1 is N - 1,
    NM2 is N - 2,
    fib(NM1,FibNM1),
    fib(NM2,FibNM2),
    FibN is FibNM1 + FibNM2.

fibTuple((0,1,0)).
fibTuple((FibN,FibNP1,N)):-
    length(_,N),
    N > 0,
    NM1 is N - 1,
    fibTuple((FibNM1,FibN,NM1)),
    FibNP1 is FibNM1 + FibN.

fastFib(N,FibN):-
    fibTuple((FibN,_,N)).
