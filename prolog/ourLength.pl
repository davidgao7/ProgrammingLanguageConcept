

% ourLength(List,LengthOfList)

ourLength([],0).
ourLength([_|T],Length):-
    ourLength(T,LengthT),
    Length is LengthT + 1.
