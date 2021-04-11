% member(Item,List)
    member(Item,[Item|_]):-!.
    member(Item,[_|T]):-
    member(Item,T).
