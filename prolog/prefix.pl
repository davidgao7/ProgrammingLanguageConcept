
prefix([_],[]).
prefix([H|T],[H|PreT]):-
    prefix(T,PreT).
