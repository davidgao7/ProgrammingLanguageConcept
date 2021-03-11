
% ourFind(List,What,Where).

ourFind([What|_],What,1).
ourFind([_|T],What,Where):-
    ourFind(T,What,WhereT),
    Where is WhereT + 1.
