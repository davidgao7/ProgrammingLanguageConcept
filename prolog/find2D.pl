% find2D(What,ListOfLists,Where)
    find2D(What,[Row|_],(0,Column)):-
    find(What,Row,Column).
    find2D(What,[_|Rows],(R,C)):-
    find2D(What,Rows,(RowsR,C)),
    R is RowsR + 1.

% find(What,List,Where)

    find(What,[What|_],0).
    find(What,[_|T],Where):-
    find(What,T,WhereT),
    Where is WhereT + 1.
    
