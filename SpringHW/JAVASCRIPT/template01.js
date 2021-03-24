var helpers = require('./helpers');
var pt = require('./csce322hw02pt01');

var maze = helpers.readMazeFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part01test01.maze.g');
var moves = helpers.readMovesFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part01test01.moves.g');
var before = maze.slice(0);
console.log("1 player one move! ")
var theFunction = pt.onePlayerOneRotation(before);
var after = theFunction(moves[0]);
console.log("=============================")
console.log("original maze: ")
helpers.printMaze(before)
helpers.printMoves(moves)
console.log("=============================")
helpers.printMaze(after);