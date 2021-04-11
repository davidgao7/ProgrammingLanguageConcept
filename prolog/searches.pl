edge(a,b).
edge(b,c).
edge(b,d).
edge(b,e).
edge(c,f).
edge(e,f).
edge(e,g).
edge(f,c).
edge(f,h).
edge(g,h).
edge(g,j).
edge(h,k).
edge(i,g).
edge(j,i).
edge(k,l).
edge(l,j).

    % dfs(From,To,Path)
    dfs(From,From,[From]).
    dfs(From,To,[From|RestOfPath]):-
    edge(From,Next),
    dfs(Next,To,RestOfPath).

    member(E,[E|_]):-!.
    member(E,[_|T]):-
    member(E,T).
    
    % dfsSmart(From,To,Visited,Path)
    dfsSmart(From,From,_,[From]).
    dfsSmart(From,To,Visited,[From|RestOfPath]):-
    edge(From,Next),
    not(member(Next,Visited)),
    dfsSmart(Next,To,[Next|Visited],RestOfPath).

    % bfs(From,To,Path)
    bfs(From,From,[From]).
    bfs(From,To,[From|RestOfPath]):-
    length(RestOfPath,_),
    edge(From,Next),
    bfs(Next,To,RestOfPath).
