%minPours
% You [define what could be done], then allow Prolog to do what needs to be done to solve the problem.
% The edges are pours. Since edges take you between nodes,

fewestRotationsSingle(Maze,Moves):- % <=6 Moves
  path(Maze,0,Moves).
