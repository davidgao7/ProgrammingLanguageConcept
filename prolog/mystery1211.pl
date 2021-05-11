mystery1211([],[]).
mystery1211([H|T],[R|S]):-
  helper1211(T,R),
  assistant1211([H|T],S).

helper1211([X],X).
helper1211([_|Y],Z):-
  helper1211(Y,Z).

assistant1211([A],[]).
assistant1211([B|C],[B|D]):-
  assistant1211(C,D).
