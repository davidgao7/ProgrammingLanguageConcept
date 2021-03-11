
ourMember(El,[El|_]).
ourMember(El,[_|T]):-
    ourMember(El,T).
