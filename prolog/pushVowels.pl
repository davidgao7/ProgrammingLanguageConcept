vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

pushVowels([],[]):-!.
pushVowels([X],[X]):-!.
pushVowels([H,N|R],[H|Result]):-
  not(vowel(H)),
  pushVowels([N|R],Result),!.

pushVowels([H,N|R],[N|Result]):-
  not(vowel(N)),
  pushVowels([H|R],Result),!.

pushVowels([H,N|R],[H,N|R]):-
  vowel(H),
  vowel(N),
  findall(Letter,(member(Letter,R),not(vowel(Letter))),NotVowels),
  length(NotVowels,0),!.

pushVowels([H,N|R],Result):-
  vowel(H),
  vowel(N),
  findall(Letter,(member(Letter,R),not(vowel(Letter))),NotVowels),
  not(NotVowels = []),
  pushVowels([N|R],Re),
  pushVowels([H|Re], Result),!.

member(X,[X|_]).
member(X,[_|T]):-
  member(X,T).
