module.exports = {
    readMazeFile: readMazeFile,
    readMovesFile: readMovesFile,
    printMaze: printMaze,
    printMoves: printMoves,
    // doSingleRotation: doSingleRotation,
    findNumberPlayers: findNumberPlayers,
    isInteger: isInteger,
    iscurrentPlayer: iscurrentPlayer,
    findgoal:findgoal
}
function findgoal(maze){
    for(var r=0;r<maze.length;r++){
        for(var c=0;c<maze[r].length;c++){
            if(maze[r][c] === 'g'){
                return true;
            }
        }
    }
    return false;
}
function iscurrentPlayer(p, currentPlayer) {
    return parseInt(p) === currentPlayer;
}

function isInteger(s) {
    var rr = parseInt(s);
    return !isNaN(rr);
}

function findNumberPlayers(maze) {
    var player = [];
    for (var r = 0; r < maze.length; r++) {
        for (var c = 0; c < maze[r].length; c++) {
            if (!isNaN(maze[r][c])) {
                player.push(maze[r][c]);
            }
        }
    }
    return player.length;
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
    var mazerow = 0;
    var mazecol = 0;

    for (var r = 0; r < rows.length; r++) {
        maze[r] = [];

        for (var c = 0; c < rows[r].length; c++) {
            if(maze[r][c] !== " " && r===0){
                mazecol++;
            }
            if(maze[r][c] !== " " && c===0){
                mazerow++;
            }
            rows[r] = rows[r].trim().replace("/ /g", "");
            maze[r][c] =  rows[r].charAt(c);
        }
    }

    var resultMaze = Array.from(Array(mazerow), () => new Array(mazecol).fill('-'))
    var rowIndex = 0;
    var colIndex = 0;
    var realY = 0;

    while(rowIndex < maze.length){
        while(colIndex < maze[rowIndex].length){
            if(maze[rowIndex][colIndex] !== " "){
                resultMaze[rowIndex][realY] = maze[rowIndex][colIndex];
                realY++;
                if(realY > mazecol-1){
                    realY = 0;
                }
            }
            colIndex++;
        }
        if(colIndex>=maze[0].length){
            colIndex = 0;
        }
        rowIndex++;
    }



    return resultMaze;
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

function printMoves(moves) {
    var moveString = "";
    for (var m = 0; m < moves.length; m++) {
        moveString = moveString +" "+ moves[m];
    }
    console.log(moveString);
}

function printMaze(arr) {
    for (var r = 0; r < arr.length; r++) {
        var row = '';
        // console.log("row %d",r, row)
        for (var c = 0; c < arr[r].length; c++) {
            if (arr[r][c] === '' || arr[r][c] === ' ') {
                // console.log('undefined at'+r);
            }
            // console.log("at index %d %d: %s", r,c,arr[r][c])
            row = row + arr[r][c];
        }
        console.log(row);
    }
}


// function doSingleRotation(maze, singleMove, player) {
//
//     // console.log("move: " + singleMove);
//     // console.log("==================in doSingleRotation====================");
//     const M = maze.length;
//     const N = maze[0].length;
//
//     switch (singleMove) {
//     //if player goes nowhere, the state of the maze is <unchanged>.
//
//         case 'c':
//             // console.log("maze before: "+ maze.length + " * "+ maze[0].length+ " dimension")
//
//             // printMaze(maze)
//             // console.log("in case c...")
//             const Cresult = Array.from(Array(N), () => new Array(M).fill('-'));
//             // console.log("maze after: "+ Cresult.length + " * " + Cresult[0].length + " dimension")
//
//             let playerX = 0;
//             let playerY = 0;
//             let originplayerX = 0;
//             let originPlayerY = 0;
//             for (let i = 0; i < maze.length; i++) {
//                 for (let j = 0; j < maze[i].length; j++) {
//
//                     if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {
//                         // the piece other than player stays fixed but relative index change
//
//                         var Y = maze.length - 1 - i;
//
//                         // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "] , result index: [" + j + ", " + Y + "]");
//
//                         if (Cresult[j][Y] === player.toString()) {
//
//                             // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "], player index in the result array for this current location, index not switching");
//
//                         } else {
//
//                             Cresult[j][Y] = maze[i][j];
//                             // console.log("switching index of regular peg, from origin index [" + i + ", " + j + "] to [" + j + " " + Y + "]");
//
//                         }
//                         // console.log("result after move c turn: ")
//                         // printMaze(Cresult)
//
//                     }
//                     else if (maze[i][j] === player.toString()) {
//                         // console.log("meet player at original maze, player initial index(case c): %s", i + " " + j);
//                         // if there's no x, can move
//                         var needbreak = false;
//                         for (let k = j + 1; k < maze[i].length; k++) {
//                             if(maze[i][k] === 'g'){// meet goal
//                                 playerX = k;
//                                 playerY = maze.length - 1 - i;
//                                 needbreak = true
//                             }
//                             if (maze[i][k] === 'x' && !needbreak) {
//                                 // reach the end
//                                 // console.log("k: "+ k);
//                                 playerX = k - 1;
//                                 // console.log("player x: "+ playerX);
//                                 playerY = maze.length - 1 - i;
//                                 if(playerX>N || playerY>M || playerX <0 || playerY<0){
//                                     // console.log("player index out of bound! "+ playerX + " " + playerY)
//                                 }
//                                 // console.log("player y: "+ playerY)
//                                 needbreak = true;
//                             }
//                         }
//                         // console.log("player initial index in maze: [%s] result index in Cresult: [%s]", i + ", " + j, playerX + ", " + playerY);
//                         Cresult[playerX][playerY] = maze[i][j];
//                         // console.log("cross out the original player index in original maze: make [%s]: in Cresult to \'-\'", j + ", " + (maze.length - 1 - i));
//                         if(j===playerX && maze.length - 1 - i===playerY){
//                             // console.log("player being block, player not move")
//                             return [maze,false]
//                         }else{
//                             Cresult[j][maze.length - 1 - i] = '-';
//                         }
//                         // console.log("result after move c turn: (player case):")
//                         // printMaze(Cresult)
//                         if((playerX===i && playerY===j) || (playerX===j && playerY===maze.length - 1 - i)){
//                             // player not move
//                             return [maze,false];
//                         }
//                     }
//                 }
//             }
//             for(let r=0;r<Cresult.length;r++){
//                 if(Cresult[r][0]==='-'){
//                     Cresult[r][0] = '';
//                 }
//             }
//             // console.log("maze before: ")
//             // printMaze(maze)
//             // console.log("maze after: ")
//             // printMaze(Cresult)
//             // console.log("========================= c done===========================")
//
//             return [Cresult,true];
//
//         case 'cc':
//             // console.log("maze before: ")
//             // printMaze(maze)
//             // console.log("in case cc...")
//             const CCresult = Array.from(Array(N), () => new Array(M).fill('-'));
//
//             for (let i = 0; i < maze.length; i++) {
//                 for (let j = 0; j < maze[i].length; j++) {
//
//                     if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {
//                         // the piece other than player stays fixed but relative index change
//
//                         var X = maze[i].length - 1 - j;
//
//                         // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "] , result index: [" + X + ", " + i + "]");
//
//                         if (CCresult[X][i] === player.toString()) {
//
//                             // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "], player index in the result array for this current location, index not switching");
//
//                         } else {
//                             CCresult[X][i] = maze[i][j];
//                             // console.log("switching index of regular peg, from origin index [" + i + ", " + j + "] to [" + X + " " + i + "]");
//                         }
//                         // console.log("result after move cc turn: ")
//                         // printMaze(CCresult)
//
//                     } else if (maze[i][j] === player.toString()) {
//                         // console.log("meet player at original maze, player initial index(case cc): %s", i + " " + j);
//                         // if there's no x, can move
//                         let YafterRotate = 0;
//                         let XafterRotate = 0;
//                         let playerMoves = 0;
//                         var needbreak = false;
//                         for (let k = j - 1; k >= 0; k--) {
//                             if(maze[i][k] === 'g'){
//                                 XafterRotate = k;
//                                 YafterRotate = i;
//                                 needbreak = true;
//                             }
//                             if (maze[i][k] === 'x' && !needbreak) {//block in the way
//                                 // console.log("player index after move: %s", maze[i].length - 1 - k - 1 + " " + i);
//                                 const YbeforeRotate = k + 1;
//                                 YafterRotate = i;
//                                 XafterRotate = maze[i].length - 1 - YbeforeRotate;
//                                 playerMoves = j - YbeforeRotate;
//                                 needbreak = true;
//                             }
//                         }
//                         // if (playerMoves >= 1) {
//                         // console.log("player initial index in maze: [%s] result index in CCresult: [%s]", i + " " + j, XafterRotate + " " + YafterRotate);
//                         CCresult[XafterRotate][YafterRotate] = maze[i][j];
//                         // console.log("cross out the original player inedx in original maze: make [%s] in CCresult to \'-\'", maze[i].length - 1 - j + " " + i);
//                         if(maze[i].length - 1 - j===XafterRotate && i===YafterRotate){
//                             // console.log("player being block, player not move")
//                             return [maze,false]
//                         }else{
//                             CCresult[maze[i].length - 1 - j][i] = '-';
//                         }
//
//                         // }
//                         // else {
//                         //     var afterX = maze[i].length - 1 - j;
//                         //     // console.log("player initial index: %s result index: %s", i + " "+ j, afterX + " " + i);
//                         //     CCresult[afterX][i] = maze[i][j];
//                         // }
//                         if((XafterRotate===i && YafterRotate===j) || (XafterRotate===j && YafterRotate===i)){
//                             // player not move
//                             return [maze,false];
//                         }
//                     }
//
//                 }
//             }
//             // console.log("maze after: ")
//             // printMaze(CCresult)
//             // console.log("========================= cc done===========================")
//             for(let r=0;r<CCresult.length;r++){
//                 if(CCresult[r][CCresult[0].length-1]==='-'){
//                     CCresult[r][CCresult[0].length-1] = '';
//                 }
//             }
//             return [CCresult,true];
//
//         case '180':
//             // console.log("maze before: ")
//             // printMaze(maze)
//             // console.log("in case 180...")
//             const flipResult = Array.from(Array(M), () => new Array(N).fill('-'));
//
//             for (let i = 0; i < maze.length; i++) {
//                 for (let j = 0; j < maze[i].length; j++) {
//                     if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {
//
//                         // regular switch
//                         let resulti = maze.length - 1 - i;
//                         let resultj = maze[i].length - 1 - j;
//
//                         // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "] , result index: [" + resulti + ", " + resultj + "]");
//
//                         if (flipResult[resulti][resultj] === player.toString()) {
//
//                             // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "], player index in the result array for this current location, index not switching");
//
//                         } else {
//
//                             flipResult[resulti][resultj] = maze[i][j];
//
//                         }
//                         // console.log("result after one move 180 turn: ")
//                         // printMaze(flipResult)
//
//                     } else if (maze[i][j] === player.toString()) {
//                         // console.log("meet player at original maze, player initial index(case 180): %s", i + " " + j);
//                         // 180: move upward related to the original maze and then have numerical relation
//                         // if there's no x, can move
//                         // var xbefore = 0;
//                         let needbreak = false;
//                         let XafterRotate = 0;
//                         let YafterRotate = 0;
//                         for (let k = i - 1; k >= 0; k--) {
//                             if(maze[k][j] === 'g'){
//                                 // flipResult[maze.length - 1 - k][maze[i].length - 1 - j] = player.toString();
//                                 XafterRotate = maze.length - 1 - k;
//                                 YafterRotate = maze[i].length - 1 - j;
//                                 needbreak = true
//                             }
//                             if (maze[k][j] === 'x' && !needbreak) {
//                                 // roadblock
//                                 const xbefore = k + 1;
//                                 XafterRotate = maze.length - 1 - xbefore;
//                                 YafterRotate = maze[i].length - 1 - j;
//                                 needbreak = true;
//                             }
//                         }
//                         // var resultX = maze.length - 1 - xbefore;
//                         // var resultY = maze[i].length - 1 - j;
//                         // console.log("player initial index in maze: [%s] result index in flipResult: [%s]", i + ", " + j, resultX + ", " + resultY);
//                         flipResult[XafterRotate][YafterRotate] = maze[i][j];// placing the player
//                         if(maze.length - 1 - i===XafterRotate && maze[i].length - 1 - j===YafterRotate){
//                             // console.log("player being block, player not move")
//                             return [maze,false]
//                         }else{
//                             flipResult[maze.length - 1 - i][maze[i].length - 1 - j] = '-';
//                         }
//                     }
//                 }
//             }
//             // console.log("maze after: ")
//             // printMaze(flipResult)
//             // console.log("========================= 180 done===========================")
//             for(let r=0;r<flipResult[0].length;r++){
//                 if(flipResult[0][r]==='-'){
//                     flipResult[0][r] = '';
//                 }
//             }
//             // printMaze(flipResult)
//             // console.log("end of the 180, if empty above this, then debug 180 swtich, if empy below, probably no idea...")
//             return [flipResult,true];
//     }
//     // console.log("========end switch==========================\n")
// }
