vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

    myStatement:-
    vowel(A),
    vowel(B),
    writeln((A,B)).
    % ?- myStatement.
    % a,a
    % true ;
    % a,e
    % true ;
    % a,i
    % true ;
    % a,o
    % true ;
    % a,u
    % true ;
    % e,a
    % true ;
    % e,e
    % true ;
    % e,i
    % true ;
    % e,o
    % true ;
    % e,u
    % true ;
    % i,a
    % true ;
    % i,e
    % true ;
    % i,i
    % true ;
    % i,o
    % true ;
    % i,u
    % true ;
    % o,a
    % true ;
    % o,e
    % true ;
    % o,i
    % true ;
    % o,o
    % true ;
    % o,u
    % true ;
    % u,a
    % true ;
    % u,e
    % true ;
    % u,i
    % true ;
    % u,o
    % true ;
    % u,u
    % true.

    myStatementWithCut:-
    vowel(A), % before cut,doesn't not have alternate solution(A doesn't change)
    !,% A won't go to find other solution next line(won't print)
    vowel(B),
    writeln((A,B)).
    % ?- myStatementWithCut.
    % a,a
    % true ;
    % a,e
    % true ;
    % a,i
    % true ;
    % a,o
    % true ;
    % a,u
    % true.
% lowercase : statement
% Uppercase: variable
% :- implication
% ,  And
% ?- Query
% ; next solution
