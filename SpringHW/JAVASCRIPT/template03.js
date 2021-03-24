var helpers = require('./helpers');
var pt = require('./csce322hw02pt03');

var maze = helpers.readMazeFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part03test01.maze.g');
var moves = helpers.readMovesFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part03test01.moves.g');
var before = maze.slice(0);
console.log("many player many moves! ")
var theFunction = pt.manyPlayersManyRotations(before);
var after = theFunction(moves);
console.log("=============================")
console.log("original maze: ")
helpers.printMaze(before)
helpers.printMoves(moves)
console.log("=============================")
helpers.printMaze(after);
