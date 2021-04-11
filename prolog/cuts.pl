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
    vowel(A),
    !,
    vowel(B),
    writeln((A,B)).
% lowercase : statement
% Uppercase: variable
% :- implication
% ,  And
% ?- Query
% ; next solution
