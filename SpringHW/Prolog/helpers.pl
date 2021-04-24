:- module( helpers,
	 [ readGravityMazeFile/3, % /3: number of arguments to the predicate,
	 printMazeGame/1,
	 check2DPlayers/2,
	 check1DPlayers/2,
	 check2dOddPlayers/1,
	 check1DRotation/2,
	 checkOddRotation/1,
	 checkMove/2,
	 findPlayer/3,
	 moveUp/5,
	 moveLeft/5,
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
%
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

moveUp(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-%STOP CASE 1: no x block, no player block, up one is goal
	PlayerX - 1 >= 0, % so that you can move up
	X is PlayerX - 1, % move up 1 row index
	nth0(X, Maze, LastRow), % row before player
	nth0(PlayerY, LastRow, UpLocation), % get element above player
	UpLocation \= x, % if there's no x as block
	not(isPlayer(UpLocation)), % if there's no player as block
	isGoal(UpLocation), % if up one is goal
	FinalPlayerX is X, % return up one's index
	FinalPlayerY is PlayerY.

moveUp(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- %STOP CASE 2: x case, stop move up, return final position
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation = x, % upper is x, cannot move, stay
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY. % stop backtracking, return final position

moveUp(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- %STOP CASE 3: other player case, stop move up, return final position
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x, % not x
	not(isGoal(UpLocation)), % not goal
	UpLocation \= (-), % not '-'
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY. % stop backtracking, return final position

moveUp(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):- % not x not player not goal, keep move up
	PlayerX - 1 >= 0,
	X is PlayerX - 1,
	nth0(X, Maze, LastRow),
	nth0(PlayerY, LastRow, UpLocation),
	UpLocation \= x,
	not(isPlayer(UpLocation)),
	not(isGoal(UpLocation)), %not meet goal
	moveUp(Maze,X,PlayerY,FinalPlayerX,FinalPlayerY).%keep moving up,! cut to prevent backtracking, there will have only 1 outcome out

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

moveLeft(Maze,PlayerX,PlayerY,FinalPlayerX,FinalPlayerY):-% x case, stop move left,return final position
	PlayerY - 1 > 0,
	Y is PlayerY - 1,
	nth0(PlayerX, Maze, PlayerRow),
	nth0(Y, PlayerRow, LeftLocation),
	LeftLocation = x,
	FinalPlayerX is PlayerX,
	FinalPlayerY is PlayerY.

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

inArray(Player,[X,Y],[PlrAndIndex|_]):- %check player with its index is in found Plr array WORK
	nth0(0,PlrAndIndex,Plr),
	nth0(1,PlrAndIndex,FX),
	nth0(2,PlrAndIndex,FY),
	Player = Plr,
	X = FX,
	Y = FY.
inArray(Plr,_,[PlrAndIndex|_]):-
	nth0(0,PlrAndIndex,Player),
	Plr = Player.
inArray(_,[X,_],[PlrAndIndex|Rest]):-
	nth0(1,PlrAndIndex,FX),
	X \= FX,
	inArray(_,[X,_],Rest).
inArray(_,[_,Y],[PlrAndIndex|Rest]):-
	nth0(2,PlrAndIndex,FY),
	Y \= FY,
	inArray(_,[_,Y],Rest).

