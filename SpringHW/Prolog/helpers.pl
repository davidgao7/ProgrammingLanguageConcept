:- module( helpers,
	 [ readGravityMazeFile/3 % /3: number of arguments to the predicate
	 , printMazeGame/1,
	 isPlayerIn1dList/2,
	 prefix/2,
	 replace1DListAtIndex/4,
	 % replace2DListAtIndex/5,
	 dropN/3,
	 takeN/3,
	 remove/2
	 ]
  ).

	% ?- prefix([x,-,-,x], Result).
	% Result = [x, -, -] .
prefix([_],[]). % ; to find all solution
prefix([],[]).
prefix([H|T],[H|P]):-
    prefix(T,P). %combine 2 rest of lists

readGravityMazeFile(File,Moves,Maze):-
    open(File,read,Input),
    read(Input,Moves),
    readMaze(Input,Temp),
    prefix(Temp,Maze),
    close(Input).

readMaze(Input,[]):-
    at_end_of_stream(Input),
    !. %True at any time.
readMaze(Input,[Row|Rows]):-
    \+ at_end_of_stream(Input), % if is not(\+) at end of stream
    read(Input,Row),
    readMaze(Input,Rows).

printMazeGame([]).
printMazeGame([Row|Rows]):-
    writeln(Row),
    printMazeGame(Rows).

% drop first n element in List
% dropN(N,ListBefore,ListAfter)
dropN(0,ListBefore,ListBefore). % WORK
dropN(_,[],[]).
dropN(N,[_|TB],ListAfter):-
    length([_|TB],LengthBefore),
    between(1,LengthBefore,N),
    NM1 is N - 1,
    dropN(NM1,TB,ListAfter).

remove(_,[],[]).
remove(List,[],List).
remove(List, [H|Rest], Result):-
		select(H,List,_). %TODO: need to remove a sublist from a list

takeN(0,ListBefore,ListBefore). %WORK
takeN(_,[],[]).
takeN(N,List,Result):-
    dropN(N, List, Rest),%WORK
    remove(List, Rest, Result).%TODO: test this line

isPlayerIn1dList(Input, [Input|_]). % WORK
isPlayerIn1dList(Input, [_|Rest]):-
    isPlayerIn1dList(Input, Rest).

replace1DListAtIndex(_, A, [], [A]). % WORK
replace1DListAtIndex(0,E,[_|T],[E|T]).
replace1DListAtIndex(Idx, Val, List, ListAfter):-
    nth0(Idx,List,_),% check if exists(0 based)
    takeN(Idx,List,Head),
    Index is Idx + 1,
    dropN(Index,List,Tail),
    append(Head,[Val],Left),
    append(Left,Tail,ListAfter).

% replace2DListAtIndex(_,_,Val,[],[Val]).
% replace2DListAtIndex(X,Y,Val,Maze,MazeAfter):-
%     nth0(X,Maze,Row),
% 		replace1DListAtIndex(Y,Val,Row,NewRow),
