rotationsAndPlayers(Rotations,Maze):-
  checkOddRotation(Rotations), % WORK
  check2dOddPlayers(Maze). % WORK
rotationsAndPlayers(Rotations,Maze):-
  \+ checkOddRotation(Rotations),
  \+ check2dOddPlayers(Maze).
