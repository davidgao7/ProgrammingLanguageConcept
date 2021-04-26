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
	 moveLeft/5,
	 moveRight/5,
	 findPlayer/4,
	 inArray/3
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
%======================================
takeN(0,_,[]).
takeN(_,[],[]).
takeN(1,[E|_],[E]).
takeN(N,Before,Result):- %WORK
	dropN(N,Before,After),
	subtract(Before,After,Result).
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
replace1dAtIndex([H|Rest],Idx,E,Result):- %replace1dAtIndex([1,2,3,4],1,5,[],Result)
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
	Result = Maze.
replace2dAtIndex(Maze,R,C,E,Result):- %WORK
	nth0(R,Maze,Row),
	replace1dAtIndex(Row,C,E,NewRow),
	takeN(R,Maze,Head),
	Rest is R + 1,
	dropN(Rest,Maze,Tail),
	append(Head,[NewRow],FirstHalf),
	append(FirstHalf,Tail,Result).
%======================================
createEmptyMaze(R,C,Maze):- %WORK
	length(Row,C),
	maplist(=(-),Row),
	length(Maze,R),
	maplist(=(Row),Maze).
%======================================
clockwiseIndex(Maze,X,Y,NewX,NewY):- %rotate x,-,g WORK
	nth0(X,Maze,Row),
	nth0(Y,Row,E),
	not(isPlayer(E)),
	length(Maze,M),
	MazeL is M-1,
	NewY is MazeL - X,
	NewX is Y.
%======================================
cclockwiseIndex(Maze,X,Y,NewX,NewY):- %rotate x,-,g WORK
	nth0(X,Maze,Row),
	nth0(Y,Row,E),
	not(isPlayer(E)),
	length(Row,RowLen),
	NewX is RowLen - 1 - Y,
	NewY is X.
%======================================
flipwiseIndex(Maze,X,Y,NewX,NewY):- %WORK
	nth0(X,Maze,Row),
	nth0(Y,Row,E),
	not(isPlayer(E)),
	length(Row,ColLen),
	length(Maze,RowLen),
	NewX is RowLen - 1 - X,
	NewY is ColLen - 1 - Y.
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,Result):-%STOP CASE 1: no x block, no player block, up one is goal
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x,
	not(isPlayer(UpLocation)),
	isGoal(UpLocation),
	FinalPlayerX is X,
	FinalPlayerY is PlayerY,
	replace2dAtIndex(Maze,FinalPlayerX,FinalPlayerY,Player,Result).
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,Result):- %STOP CASE 2: x case, stop move up, return final position
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation = x, % upper is x, cannot move, stay
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY, % stop backtracking, return final position
	replace2dAtIndex(Maze,FinalPlayerX,FinalPlayerY,Player,Result).
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,Result):- %STOP CASE 3: other player case, stop move up, return final position
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x, % not x
	not(isGoal(UpLocation)), % not goal
	UpLocation \= (-), % not '-'
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY. % stop backtracking, return final position
	replace2dAtIndex(Maze,FinalPlayerX,FinalPlayerY,Player,Result).
%======================================
moveUp(Maze,PlayerX,PlayerY,Player,Result):- % not x not player not goal, keep move up
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x,
	not(isPlayer(UpLocation)),
	not(isGoal(UpLocation)), %not meet goal
	moveUp(Maze,X,PlayerY,Player,Result).%keep moving up,! cut to prevent backtracking, there will have only 1 outcome out
%======================================
moveLeft(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-% no x block , no player block, left is goal
	PlayerY - 1 > 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation \= x,
	not(isPlayer(LeftLocation)),
	isGoal(LeftLocation),
	FinalPlayerX is PlayerX,
	FinalPlayerY is Y.
%======================================
moveLeft(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-% x case, stop move left,return final position
	PlayerY - 1 > 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation = x,
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY.
%======================================
moveLeft(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-% other player case, stop move left, return final position
	PlayerY - 1 > 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation \= x,
	not(isGoal(LeftLocation)),
	LeftLocation \= (-),
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY.
%======================================
moveLeft(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-% not x not player not goal, keep move left
	PlayerY - 1 > 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation \= x,
	not(isPlayer(LeftLocation)),not(isGoal(LeftLocation)),
	FinalPlayerX is PlayerX,
	FinalPlayerY is Y,
	moveLeft(FinalMaze,PlayerX,Y,FinalPlayerX,FinalPlayerY).
%======================================
moveRight(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-
	nth0(0,Maze,Row),
	length(Row,RowLen),
	PlayerY + 1 < RowLen,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	RowLenIdx is RowLen - 1,
	Y < RowLenIdx,
	nth0(Y, PlayerRow, RightLocation),
	RightLocation \= x,
	not(isPlayer(RightLocation)),
	isGoal(RightLocation),% no x block, no player block, right is goal
	FinalPlayerX is PlayerX,
	FinalPlayerY is Y.
%======================================
moveRight(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- % x case, stop move right, return final position
	nth0(0,Maze,Row),
	length(Row,RowLen),
	PlayerY + 1 < RowLen,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, RightLocation),
	RightLocation = x,
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY.
%======================================
moveRight(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- % other player case, stop move right, return final position
	nth0(0,Maze,Row),
	length(Row,RowLen),
	PlayerY + 1 < RowLen,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, RightLocation),
	RightLocation \= x,
	not(isGoal(RightLocation)),
	RightLocation \= (-),
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY.
%======================================
moveRight(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- % not x not player not goal , keep moving right
	nth0(0,Maze,Row),
	length(Row,RowLen),
	PlayerY + 1 < RowLen,
	Y is PlayerY + 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, RightLocation),
	RightLocation \= x,
	not(isPlayer(RightLocation)),
	not(isGoal(RightLocation)),
	FinalPlayerX is PlayerX,
	FinalPlayerY is Y,
	moveRight(Finalmaze,PlayerX,Y,FinalPlayerX,FinalPlayerY).
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
findPlayer([],_,_,[]):-!.
findPlayer(Maze, X, Y,PlayerArray):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	isPlayer(Col),!,
	not(inArray(Col,[X,Y],PlayerArray)),!,
	append(PlayerArray,[[Col,X,Y]],NewplayerArray),
	length(Row,M),
	ColLen is  M-1,
	Y < ColLen,
	Ynext is Y + 1,
	findPlayer(Maze,X,Ynext,NewplayerArray).
%======================================
findPlayer(Maze, X, Y,PlayerArray):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	isPlayer(Col),!,
	not(inArray(Col,[X,Y],PlayerArray)),!,
	append(PlayerArray,[[Col,X,Y]],NewplayerArray),
	length(Maze,M),
	length(Row,N),
	RowLen is  M-1,
	ColLen is N-1,
	Y > ColLen,
	X < RowLen, % next Row
	Xnext is X+1,
	findPlayer(Maze, Xnext, 0,NewplayerArray).
%======================================
findPlayer(Maze, X, Y,PlayerArray):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	isPlayer(Col),!,
	inArray(Col,[X,Y],PlayerArray),!,
	length(Maze,M),
	length(Row,N),
	RowLen is  M-1,
	ColLen is N-1,
	Y > ColLen,
	X < RowLen,
	Xnext is X+1,
	findPlayer(Maze, Xnext, 0,NewplayerArray).
%======================================
findPlayer(Maze, X, Y,PlayerArray):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	not(isPlayer(Col)),!,
	length(Row,M),
	length(Maze,N),
	RowLen is M-1,
	ColLen is N-1,
	RowIndex is RowLen,
	Y < RowIndex,
	X < ColLen,
	Ynext is Y+1,
	findPlayer(Maze,X,Ynext,PlayerArray).
%======================================
findPlayer(Maze, X, Y,PlayerArray):-
	nth0(X,Maze,Row),
	nth0(Y,Row,Col),
	not(isPlayer(Col)),!,
	length(Row,M),
	RowIndex is M-1,
	Y + 1 >= RowIndex,
	Xnext is X+1,
	findPlayer(Maze,Xnext,0,PlayerArray).
%======================================
findPlayer(Maze, X, _,_):-
	length(Maze,M),
	MazeLength is M - 1,
	X > MazeLength,
	false.
%======================================
