% A, B, and C are capacities of three jugs, A is assumed to be full, while B and C are empty
% Target is the quantity that you want remaining in one of the jugs
% Pours is the sequence of pours that will get you from the start state to the target
%The edges are pours. Since edges take you between nodes,
%the nodes are the state of the system (contents of all three jugs).

minPours((A,B,C),Target,Pours):-
    between(0,A,Target), % Target must be a non-negative value no larger than the capacity of A
    length(Pours,MinPoursLength),
    poursPath((A,B,C),Target,(A,0,0),Pours).

done((A,_,_),A).
done((_,B,_),B).
done((_,_,C),C).

poursPath(_,Target,Current,[]):-
    done(Current,Target).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[1->2|Pours]):-
    between(1,MaxA,CurrA), % A must be non-empty
    PossB is MaxB - 1, % B must have some room remaining
    between(0,PossB,CurrB),
    FillB is MaxB - CurrB,
    Change is min(CurrA,FillB), % either empty A or fill B
    NextA is CurrA - Change,
    NextB is CurrB + Change,
    Next = (NextA,NextB,CurrC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[2->1|Pours]):-
    between(1,MaxB,CurrB),
    PossA is MaxA - 1,
    between(0,PossA,CurrA),
    FillA is MaxA - CurrA,
    Change is min(CurrB,FillA),
    NextB is CurrB - Change,
    NextA is CurrA + Change,
    Next = (NextA,NextB,CurrC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[1->3|Pours]):-
    between(1,MaxA,CurrA),
    PossC is MaxC - 1,
    between(0,PossC,CurrC),
    FillC is MaxC - CurrC,
    Change is min(CurrA,FillC),
    NextA is CurrA - Change,
    NextC is CurrC + Change,
    Next = (NextA,CurrB,NextC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[3->1|Pours]):-
    between(1,MaxC,CurrC),
    PossA is MaxA - 1,
    between(0,PossA,CurrA),
    FillA is MaxA - CurrA,
    Change is min(CurrC,FillA),
    NextC is CurrC - Change,
    NextA is CurrA + Change,
    Next = (NextA,CurrB,NextC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[2->3|Pours]):-
    between(1,MaxB,CurrB),
    PossC is MaxC - 1,
    between(0,PossC,CurrC),
    FillC is MaxC - CurrC,
    Change is min(CurrB,FillC),
    NextB is CurrB - Change,
    NextC is CurrC + Change,
    Next = (CurrA,NextB,NextC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
poursPath((MaxA,MaxB,MaxC),Target,(CurrA,CurrB,CurrC),[3->2|Pours]):-
    between(1,MaxC,CurrC),
    PossB is MaxB - 1,
    between(0,PossB,CurrB),
    FillB is MaxB - CurrB,
    Change is min(CurrC,FillB),
    NextC is CurrC - Change,
    NextB is CurrB + Change,
    Next = (CurrA,NextB,NextC),
    poursPath((MaxA,MaxB,MaxC),Target,Next,Pours).
