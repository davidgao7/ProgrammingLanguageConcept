vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

    myStatement:-
    vowel(A),
    vowel(B),
    writeln((A,B)).

    myStatementWithCut:-
    vowel(A), % before cut, doesn't not have alternate solution
    !,% A won't go to find other solution next line(won't print)
    vowel(B),
    writeln((A,B)).
% lowercase : statement
% Uppercase: variable
% :- implication
% ,  And
% ?- Query
% ; next solution
