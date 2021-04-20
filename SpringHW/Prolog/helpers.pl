:- module( helpers,
	 [ readGravityMazeFile/3
	 , printMazeGame/1
	 [ readGravityMazeFile/3 % /3: number of arguments to the predicate
	 check2DPlayers/2,
	 check1DPlayers/2,
	 check2dOddPlayers/1,
	 check1DRotation/2,
	 checkOddRotation/1
	 ]
    ).
  ).

prefix([_],[]).
prefix([H|T],[H|P]):-%if
    prefix(T,P).

% ? - readGravityMazeFile (" part01test01 . g " , Moves , Maze ) .
% Moves = 1 d list
% Maze = 2 d List
readGravityMazeFile(File,Moves,Maze):-
    open(File,read,Input),
    read(Input,Moves),
    readMaze(Input,Temp),
    prefix(Temp,Maze),
    close(Input).

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

checkOddRotation(Rotations):- % WORK
	check1DRotation(Rotations,Result), % WORK
	1 is Result mod 2. % WORK
	% writeln(Rotations),
checkOddRotation(Rotations):- %WORK
	check1DRotation(Rotations,Result),
	1 is Result mod 2.
