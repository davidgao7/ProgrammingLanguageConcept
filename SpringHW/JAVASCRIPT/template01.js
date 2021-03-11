var helpers = require('./helpers');
var pt = require('./csce322hw02pt01');

var maze = helpers.readMazeFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part01test02.maze.g');
var moves = helpers.readMovesFile('/Users/tengjungao/CSCE322/SpringHW/JAVASCRIPT/part01test02.moves.g');
console.log("maze before: ");
helpers.printMaze(maze);
console.log("move: "+moves[0]);
console.log("\n=================\n");
var before = maze.slice(0);
var theFunction = pt.onePlayerOneRotation(before);
var after = theFunction(moves[0]);
console.log("maze after: ")
helpers.printMaze(after);
