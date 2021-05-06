:- module( helpers,
	 [ readGravityMazeFile/3, % /3: number of arguments to the predicate,
	 printMazeGame/1,
	 check2DPlayers/2,
	 check1DPlayers/2,
	 check2dOddPlayers/1,
	 check1DRotation/2,
	 checkOddRotation/1,
	 prefix/2,
	 replace1dAtIndex/4,
	 replace2dAtIndex/5,
	 takeN/3,
	 dropN/3,
	 clockwiseIndex/5,
	 cclockwiseIndex/5,
	 flipwiseIndex/5,
	 createEmptyMaze/3,
	 moveUp/5,
	 moveDown/5,
	 moveLeft/5,
	 moveRight/5,
	 %======================================
	 findPlayer1d/3,
	 findPlayer2d/4,
	 inArray/3,
	 hasGoal/3,
	 path/3
	 ]
).
readGravityMazeFile(File,Moves,Maze):-
    open(File,read,Input),
    read(Input,Moves),
    readMaze(Input,Temp),
    prefix(Temp,Maze),
    close(Input).

prefix([_],[]).
prefix([H|T],[H|P]):-
		prefix(T,P).

readMaze(Input,[]):-
    at_end_of_stream(Input),
    !.
readMaze(Input,[Row|Rows]):-
    \+ at_end_of_stream(Input),
    read(Input,Row),
    readMaze(Input,Rows).

printMazeGame([]).
printMazeGame([Row|Rows]):-
    writeln(Row),
    printMazeGame(Rows).

check1DPlayers([],0).% WORK
check1DPlayers([E|Rest],Player):-
	number(E), % WORK
	check1DPlayers(Rest,TPlayer), % WORK
	Player is TPlayer + 1.
check1DPlayers([E|Rest],Player):-
	\+ number(E), % WORK
	check1DPlayers(Rest,Player).% WORK

check2DPlayers([],0). % WORK
check2DPlayers([Row|Rest],Players):-
	check1DPlayers(Row,D1Player), % WORK
	check2DPlayers(Rest,SubPlayers), % WORK
	Players is SubPlayers + D1Player. % WORK

check2dOddPlayers(Maze):- % WORK
	check2DPlayers(Maze,Players), % WORK
	1 is Players mod 2. % WORK

check1DRotation([],0). % WORK
check1DRotation([_|Rest],Result):- % WORK
	check1DRotation(Rest, Restresult), % WORK
	Result is Restresult + 1. % WORK

checkOddRotation(Rotations):- %WORK
	check1DRotation(Rotations,Result),
	1 is Result mod 2.

isGoal(g).
isPlayer(0).
isPlayer(1).
isPlayer(2).
isPlayer(3).
isPlayer(4).
isPlayer(5).
isPlayer(6).
isPlayer(7).
isPlayer(8).
isPlayer(9).
%======================================
% Professor: Save the H to the front of the third argument of takeN,
% then fill in the tail of the third argument from the recursive call.
%======================================
takeN(0,_,[]).
takeN(_,[],[]).
takeN(1,[E|_],[E]).
takeN(N,[H|Rest],[H|Result]):- %WORK
	N > 0,
	NM1 is N - 1,
	takeN(NM1, Rest, Result).
%======================================
dropN(0,Before,Before).
dropN(_,[],[]).
dropN(N,[_|TB],TA):- %WORK
	length(_,N),
	N > 0,
	NM1 is N - 1,
	dropN(NM1,TB, TA).
%======================================
replace1dAtIndex([],_,E,[E]). %WORK
replace1dAtIndex([_|Rest],0,E,[E|Rest]). %WORK
replace1dAtIndex([H|Rest],Idx,E,Result):-
	Idx \= 0,
	Idxx is Idx - 1,
	append([H],SubList,Result),
	%======================================
	replace1dAtIndex(Rest,Idxx,E,SubList). % WORK

replace2dAtIndex([],_,_,E,[E]).
replace2dAtIndex(Maze,R,C,E,Result):- %WORK
	nth0(R,Maze,Row),
	nth0(C,Row,Ele),
	Ele = E,
	Result = Maze,!.
replace2dAtIndex(Maze,R,C,-,Result):- %WORK
	nth0(R,Maze,Row),
	nth0(C,Row,Ele),
	Ele = (-),
	Result = Maze,!.
replace2dAtIndex(Maze,R,C,E,Result):- %WORK
	nth0(R,Maze,Row),
	replace1dAtIndex(Row,C,E,NewRow),
	takeN(R,Maze,Head),
	Drop is R + 1,
	dropN(Drop,Maze,Tail),
	append(Head,[NewRow],FirstHalf),
	append(FirstHalf,Tail,Result),!.
%======================================
createEmptyMaze(R,C,Maze):- %WORK
	length(Row,C),
	maplist(=(-),Row),
	length(Maze,R),
	maplist(=(Row),Maze).
%======================================
clockwiseIndex(Maze,X,Y,NewX,NewY):- %rotate x,-,g WORK
	% nth0(X,Maze,Row),
	% nth0(Y,Row,E),
	% not(isPlayer(E)),
	length(Maze,M),
	MazeL is M-1,
	NewY is MazeL - X,
	NewX is Y.
%======================================
cclockwiseIndex(Maze,X,Y,NewX,NewY):- %rotate x,-,g WORK
	nth0(X,Maze,Row),
	% nth0(Y,Row,E),
	% not(isPlayer(E)),
	length(Row,RowLen),
	NewX is RowLen - 1 - Y,
	NewY is X.
%======================================
flipwiseIndex(Maze,X,Y,NewX,NewY):- %WORK
	nth0(X,Maze,Row),
	% nth0(Y,Row,E),
	% not(isPlayer(E)),
	length(Row,ColLen),
	length(Maze,RowLen),
	NewX is RowLen - 1 - X,
	NewY is ColLen - 1 - Y.
%======================================
moveUp(Maze,PlayerX,PlayerY,_,FinalResult):-
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation = x,
	FinalResult = Maze.
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,FinalResult):-%WORK
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x,
	not(isPlayer(UpLocation)),
	isGoal(UpLocation),
	replace2dAtIndex(Maze,X,PlayerY,Player,Result),
	replace2dAtIndex(Result,PlayerX,PlayerY,(-),FinalResult).
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,Result):- % not x not player not goal, keep move up WORK
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x,
	not(isPlayer(UpLocation)),
	not(isGoal(UpLocation)), %not meet goal
	replace2dAtIndex(Maze,PlayerX,PlayerY,(-),Result1),
	replace2dAtIndex(Result1,X,PlayerY,Player,CurrentMaze),
	moveUp(CurrentMaze,X,PlayerY,Player,Result).%keep moving up,! cut to prevent backtracking, there will have only 1 outcome out
%======================================
moveDown(Maze,PlayerX,PlayerY,Player,FinalResult):-
	length(Maze,L),
	PlayerX + 1 < L,
	X is PlayerX + 1,
	nth0(X, Maze, NextRow),
	nth0(PlayerY, NextRow, DownLocation),
	DownLocation \= x,
	not(isPlayer(DownLocation)),
	isGoal(DownLocation),
	replace2dAtIndex(Maze,X,PlayerY,Player,Result),
	replace2dAtIndex(Result,PlayerX,PlayerY,(-),FinalResult).
%======================================
moveDown(Maze,PlayerX,PlayerY,Player,FinalResult):-
	length(Maze,L),
	PlayerX + 1 < L,
	X is PlayerX + 1,
	nth0(X, Maze, NextRow),
	nth0(PlayerY, NextRow, DownLocation),
	DownLocation \= x,
	not(isPlayer(DownLocation)),
	not(isGoal(DownLocation)),
	replace2dAtIndex(Maze,PlayerX,PlayerY,(-),Result1),
	replace2dAtIndex(Result1,X,PlayerY,Player,CurrentMaze),
	moveDown(CurrentMaze,X,PlayerY,Player,FinalResult).
%======================================
moveDown(Maze,PlayerX,PlayerY,Player,FinalResult):-
	length(Maze,L),
	PlayerX + 1 < L,
	X is PlayerX + 1,
	nth0(X, Maze, NextRow),
	nth0(PlayerY, NextRow, DownLocation),
	DownLocation = x,
	FinalResult = Maze.
%======================================
moveLeft(Maze,PlayerX,PlayerY,_,FinalResult):-
	PlayerY - 1 >= 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation = x,
	FinalResult = Maze.
%======================================
moveLeft(Maze,PlayerX,PlayerY,Player,FinalResult):-% no x block , no player block, left is goal
	PlayerY - 1 >= 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation \= x,
	not(isPlayer(LeftLocation)),
	isGoal(LeftLocation),
	replace2dAtIndex(Maze,PlayerX,Y,Player,Result),
	replace2dAtIndex(Result,PlayerX,PlayerY,(-),FinalResult).
%======================================
moveLeft(Maze,PlayerX,PlayerY,Player,Result):-% not x not player not goal, keep move left
	PlayerY - 1 >= 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation \= x,
	not(isPlayer(LeftLocation)),
	not(isGoal(LeftLocation)),
	replace2dAtIndex(Maze,PlayerX,PlayerY,(-),Result1),
	replace2dAtIndex(Result1,PlayerX,Y,Player,CurrentMaze),
	moveLeft(CurrentMaze,PlayerX,Y,Player,Result).
%======================================
moveRight(Maze,PlayerX,PlayerY,Player,FinalResult):-
	nth0(0,Maze,Row),%WORK
	length(Row,RowLen),%WORK
	PlayerY + 1 < RowLen,%WORK
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	%======================================
	nth0(Y, PlayerRow, RightLocation),
	RightLocation \= x,
	not(isPlayer(RightLocation)),
	isGoal(RightLocation),
	replace2dAtIndex(Maze,PlayerX,Y,Player,Result),
	replace2dAtIndex(Result,PlayerX,PlayerY,(-),FinalResult).
%======================================
moveRight(Maze,PlayerX,PlayerY,Player,Result):-% not x not player not goal, keep move right
	nth0(0,Maze,Row),
	length(Row,RowLen),
	PlayerY + 1 < RowLen,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	%======================================
	nth0(Y, PlayerRow, RightLocation),
	RightLocation \= x,
	not(isPlayer(RightLocation)),
	not(isGoal(RightLocation)),
	replace2dAtIndex(Maze,PlayerX,PlayerY,(-),Result1),
	replace2dAtIndex(Result1,PlayerX,Y,Player,CurrentMaze),
	moveRight(CurrentMaze,PlayerX,Y,Player,Result).
% %======================================
moveRight(Maze,PlayerX,PlayerY,_,FinalResult):- % x case, stop move right, return final position
	nth0(0,Maze,Row),
	length(Row,RowLen),
	RowLen > PlayerY + 1,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, RightLocation),
	RightLocation = x,
	FinalResult = Maze.
%======================================
inArray(Player,[X,Y],[PlrAndIndex|_]):- %check player with its index is in found Plr array WORK
	nth0(0,PlrAndIndex,Plr),
	nth0(1,PlrAndIndex,FX),
	nth0(2,PlrAndIndex,FY),
	Player = Plr,
	X = FX,
	Y = FY.
%======================================
inArray(Plr,_,[PlrAndIndex|_]):-
	nth0(0,PlrAndIndex,Player),
	Plr = Player.
%======================================
inArray(_,[X,_],[PlrAndIndex|Rest]):-
	nth0(1,PlrAndIndex,FX),
	X \= FX,
	inArray(_,[X,_],Rest).
%======================================
inArray(_,[_,Y],[PlrAndIndex|Rest]):-
	nth0(2,PlrAndIndex,FY),
	Y \= FY,
	inArray(_,[_,Y],Rest).
%======================================
findPlayer1d([E|_],E,0). %WORK
findPlayer1d([_|Rest],E,Idx):-
	findPlayer1d(Rest,E,I),
	Idx is I + 1.
%======================================
findPlayer2d([Row|_],E,0,Y):-
	findPlayer1d(Row,E,Yn),
	Y is Yn.
findPlayer2d([Row|Rest],E,Xnext,Y):-
	not(findPlayer1d(Row,E,Y)),
	length([Row|Rest],Xlen),
	XX is Xlen - 1,
	findPlayer2d(Rest,E,X,Y),
	X < XX,
	Xnext is X + 1.
%======================================
hasGoal(Maze,X,Y):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	isGoal(Col).%isGoal(g).
%======================================
hasGoal(Maze,X,Y):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	not(isPlayer(Col)),
	length(Row,M),
	RowLen is M-1,
	Y < RowLen,
	Ynext is Y + 1,
	hasGoal(Maze,X,Ynext).
%======================================
hasGoal(Maze,X,Y):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	not(isPlayer(Col)),
	length(Row,M),
	RowLen is M-1,
	Y >=RowLen,
	Xnext is X + 1,
	hasGoal(Maze,Xnext,0).
%======================================
mazeafterPlayerClockwise(Maze,X,Y,NewMaze):-
	findPlayer2d(Maze,1,PlayerX,PlayerY),
	nth0(X,Maze,PlayerRow),
	nth0(Y,PlayerRow,Player),
	moveRight(Maze,PlayerX,PlayerY,Player,NewMaze).
%======================================
mazeafterPlayerCClockwise(Maze,X,Y,NewMaze):-
	findPlayer2d(Maze,1,PlayerX,PlayerY),
	nth0(X,Maze,PlayerRow),
	nth0(Y,PlayerRow,Player),
	moveLeft(Maze,PlayerX,PlayerY,Player,NewMaze).
%======================================
mazeafterPlayerflipwise(Maze,X,Y,NewMaze):-
	findPlayer2d(Maze,1,PlayerX,PlayerY),
	nth0(X,Maze,PlayerRow),
	nth0(Y,PlayerRow,Player),
	moveUp(Maze,PlayerX,PlayerY,Player,NewMaze).
%======================================
path(CurrentMaze,Count,[]):- %goal has been reached
	between(0,7,Count),
	not(findPlayer2d(CurrentMaze,g,_,_)).%WORK
path(CurrentMaze,Count,[c|Path]):- %TODO: do not use nested list, use <append> for simplicity (Professor use transpose for rotation)
	between(1,6,L),
	length(Path,L),
	findPlayer2d(CurrentMaze,g,_,_),
	R is Count mod 4,
	R = 0,% C: 0->moveright , 1->moveUp , 2->moveLeft , 3->moveDown
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),%WORK
	moveRight(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),%WORK
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[c|Path]):- %Variables are local to the predicates they are in. In Line 395 and Line 396, R can never be anything other than 1 for the predicate to keep moving to Line 397.
	R is Count mod 4,
	R = 1,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveUp(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[c|Path]):-
	R is Count mod 4,
	R = 2,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveLeft(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[c|Path]):-
	R is Count mod 4,
	R = 3,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveDown(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[cc|Path]):-
	R is Count mod 4,
	R = 0,% CC: 0->moveLeft, 1->moveUp, 2->moveRight, 3->moveDown
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveLeft(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[cc|Path]):-
	R is Count mod 4,
	R = 1,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveUp(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[cc|Path]):-
	R is Count mod 4,
	R = 2,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveRight(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[cc|Path]):-
	R is Count mod 4,
	R = 3,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveDown(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[180|Path]):-
	R is Count mod 2, %180: 0->moveUp , 1->moveDown
	R = 1,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveUp(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	nth0(0,Path,P),
	not(P = 180), % only 180 twice will redo each other
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
path(CurrentMaze,Count,[180|Path]):-
	R is Count mod 2,
	R = 0,
	findPlayer2d(CurrentMaze,1,PlayerX,PlayerY),
	moveDown(CurrentMaze,PlayerX,PlayerY,1,MazeAfterPlayerMove),
	nth0(0,Path,P),
	not(P = 180), % only 180 twice will redo each other
	between(1,6,L),
	length(Path,L),
	CountNext is Count + 1,
	path(MazeAfterPlayerMove,CountNext,Path).
