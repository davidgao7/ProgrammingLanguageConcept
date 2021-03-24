module.exports = {
    manyPlayersManyRotations: manyPlayersManyRotations
}

var helpers = require('./helpers');

function manyPlayersManyRotations(maze) {
    // TODO: IMPORTANT:gravity affects everyone
    function whatever(moves) {
        var result = maze;

        if (!helpers.findgoal(result)) {//goal has reached
            return result;
        }

        for (var moveIndex = 0; moveIndex < moves.length; moveIndex++) {

            const M = result.length;
            const N = result[0].length;

            var move = moves[moveIndex]
            console.log("maze: ");
            helpers.printMaze(result);

            console.log("move: " + move)
            console.log("========================")

            switch (move) {

                case 'c':
                    const Cresult = Array.from(Array(N), () => new Array(M).fill('-'));


                    for (let i = 0; i < M; i++) {
                        for (let j = 0; j < N; j++) {
                            // other player will act as wall, but every player will effect by gravity for
                            // each move

                            if (result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g') {

                                var Y = M - 1 - i;

                                Cresult[j][Y] = result[i][j];


                            } else {
                                // every player move together
                                //whenever see a player
                                let playerX = 0;
                                let playerY = 0;
                                var Cneedbreak = false;

                                for (let k = j + 1; k < N; k++) {

                                    if (result[i][k] === 'g' && !Cneedbreak) {//any of the player reach the goal...

                                        playerX = k;
                                        playerY = M - 1 - i;
                                        Cneedbreak = true;
                                    }

                                    if (result[i][k] !== '-' && !Cneedbreak) {
                                        // TODO:解决同时贴着下落
                                        playerX = k-1;
                                        playerY = M - 1 - i;
                                        Cneedbreak = true;
                                        result[i - 1][k] = result[i][j];
                                    }
                                }

                                Cresult[playerX][playerY] = result[i][j];
                                result[i][j] = '-'
                            }

                        }

                    }
                    for (let r = 0; r < Cresult.length; r++) {
                        if (Cresult[r][0] === '-') {
                            Cresult[r][0] = '';
                        }
                    }
                    result = Cresult;
                    break;

                case 'cc':
                    const CCresult = Array.from(Array(N), () => new Array(M).fill('-'));
                    for (let i = 0; i < M; i++) {
                        for (let j = 0; j < N; j++) {
                            if ((result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g')) {
                                // the piece other than player stays fixed but relative index change

                                var X = N - 1 - j;


                                CCresult[X][i] = result[i][j];
                                // console.log("switching index of regular peg, from origin index [" + i + ", " + j + "] to [" + X + " " + i + "]");

                                // console.log("result after move cc turn: ")
                                // printMaze(CCresult)

                            } else {
                                //every player move together
                                // if there's no x, can move
                                let YafterRotate = 0;
                                let XafterRotate = 0;
                                var CCneedbreak = false;

                                for (let k = j - 1; k >= 0; k--) {

                                    if (result[i][k] === 'g' && !CCneedbreak) {

                                        XafterRotate = N - 1 - k;
                                        YafterRotate = i;
                                        CCneedbreak = true;
                                    }

                                    if (result[i][k] !== '-' && !CCneedbreak) {

                                        // console.log(i + " "+ j + " "+result[i][j])
                                        // console.log(i + " "+ k + " "+result[i][k])
                                        YafterRotate = i;
                                        XafterRotate = N - 2 - k;
                                        // console.log("x after rotate "+ XafterRotate)
                                        // console.log("Y after rotate " + YafterRotate)
                                        CCneedbreak = true;
                                        result[i][k + 1] = result[i][j];
                                    }
                                }
                                CCresult[XafterRotate][YafterRotate] = result[i][j];
                                result[i][j] = '-';
                            }
                        }
                    }
                    for (let r = 0; r < CCresult.length; r++) {
                        if (CCresult[r][CCresult[r].length - 1] === '-') {
                            CCresult[r][CCresult[r].length - 1] = '';
                        }
                    }
                    result = CCresult;
                    break;

                case '180':
                    const flipResult = Array.from(Array(M), () => new Array(N).fill('-'));// correct dimension

                    for (var i = 0; i < M; i++) {
                        for (var j = 0; j < N; j++) {//correct indexing

                            if ((result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g')) {

                                let resulti = M - 1 - i;
                                let resultj = N - 1 - j;

                                if (flipResult[resulti][resultj] === '-') {
                                    // in case rotated player are already there

                                    flipResult[resulti][resultj] = result[i][j];
                                    // console.log("symbol: " + result[i][j]);
                                    // console.log("initial index: " + i + " " + j);
                                    // console.log("flip index: " + resulti + " " + resultj);
                                    // helpers.printMaze(flipResult)
                                    // console.log("========================\n")
                                }

                            } else {

                                let playerNewX = 0;
                                let playerNewY = 0;
                                var flipneedbreak = false;

                                for (let k = i - 1; k >= 0; k--) {

                                    if (result[k][j] === 'g' && !flipneedbreak) {//x or player not in current move

                                        playerNewX = M - 1 - (k + 1);
                                        playerNewY = N - 1 - j;

                                        flipneedbreak = true;
                                    }

                                    if (result[k][j] !== '-' && !flipneedbreak) {

                                        playerNewX = M - 1 - (k + 1);//16
                                        playerNewY = N - 1 - j;//3
                                        flipneedbreak = true;
                                    }
                                }
                                // console.log("symbol: " + result[i][j]);
                                // console.log("initial index: " + i + " " + j);
                                // console.log("flip index: " + playerNewX + " " + playerNewY);
                                flipResult[playerNewX][playerNewY] = result[i][j];
                                // helpers.printMaze(flipResult)
                                // console.log("========================\n")
                            }
                        }
                    }

                    for (let c = 0; c < flipResult[0].length; c++) {
                        if (flipResult[0][c] === '-') {
                            flipResult[0][c] = '';
                        }
                    }

                    result = flipResult;
                    break;

                // webgrader will scan last line empty move but it won't affect result maze
            }

            helpers.printMaze(result)
            console.log("///=================================///")

        }
        return result;
    }

    return whatever;
}
