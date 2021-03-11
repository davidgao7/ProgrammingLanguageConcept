module.exports = {
    readMazeFile: readMazeFile,
    readMovesFile: readMovesFile,
    printMaze: printMaze,
    printMoves: printMoves,
    doSingleRotation: doSingleRotation,
}

function readMazeFile(file) {
    var text;
    var lines = [];
    var rows = [];
    var filesystem = require('fs');

    text = filesystem.readFileSync(file);
    rows = text.toString().split("\n");
    // rows.pop();

    var maze = [];
    for (var r = 0; r < rows.length; r++) {
        maze[r] = [];
        for (var c = 0; c < rows[r].length; c++) {
            maze[r][c] = rows[r].charAt(c);
        }
    }

    return maze;
}

function readMovesFile(file) {
    var text;
    var line = [];
    var filesystem = require('fs');
    var row = [];
    var moves = [];

    text = filesystem.readFileSync(file);
    moves = text.toString().split("\n");

    return moves;
}

function printMaze(maze) {
    for (var r = 0; r < maze.length; r++) {
        var row = "";
        for (var c = 0; c < maze[r].length; c++) {
            row = row + maze[r][c];
        }
        console.log(row);
    }
}

function printMoves(moves) {
    var moveString = "";
    for (var m = 0; m < moves.length; m++) {
        moveString = moveString + moves[m];
    }
    console.log(moveString);
}

function doSingleRotation(maze, singleMove, player) {

    var result = new Array(maze[0].length);
    // copy the origin maze first
    for (var r = 0; r < maze.length; r++) {
        result[r] = new Array(maze.length);
    }


    switch (singleMove) {
        case 'c':
            for (let i = 0; i < maze.length; i++) {
                for (let j = 0; j < maze[i].length; j++) {

                    if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {
                        // the piece other than player stays fixed but relative index change
                        result[maze.length - j - 1][i] = maze[i][j];
                    } else if (maze[i][j] === player) {
                        // if there's no x, can move
                        for (let k = j + 1; k < maze[i].length; k++) {
                            if (maze[i][k] === 'x') {
                                // reach the end
                                result[i][k - 1] = player;
                                result[i][j] = '-';
                            }
                        }
                    }
                }
            }
            break;

        case 'cc':
            for (let i = 0; i < maze.length; i++) {
                for (let j = 0; j < maze[i].length; j++) {

                    if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {
                        // the piece other than player stays fixed but relative index change
                        var xRotate = maze[i].length - 1 - j;
                        console.log("initial index : %s result index: %s", i + " " + j, xRotate + " " + j);
                        result[xRotate][i] = maze[i][j];
                    } else if (maze[i][j] === player) {
                        // if there's no x, can move
                        for (let k = 0; k < j; k++) {
                            if (maze[i][k] === 'x') {
                                result[i][k + 1] = player;
                                result[i][j] = '-';
                            }
                        }
                    }
                }
            }
            break;

        case '180':

            break;

        default:
            break; //invalid move
    }
    return result;
}