% find(What,List,Where)

    find(What,[What|_],0).
    find(What,[_|T],Where):-
    find(What,T,WhereT),
    Where is WhereT + 1.
    
