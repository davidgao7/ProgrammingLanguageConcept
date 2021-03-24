module.exports = {
    onePlayerManyRotations: onePlayerManyRotations
}

var helpers = require('./helpers');

function onePlayerManyRotations(maze) {

    function whatever(moves) {
        var result = maze;
        var player = 1;

        for (var i = 0; i < moves.length; i++) {

            if (moves[i] !== '') {


                // console.log("move: "+ moves[i])
                // console.log("given maze: ")
                // helpers.printMaze(result)
                const M = result.length;
                const N = result[0].length;
                switch (moves[i]) {
                    //if player goes nowhere, the state of the maze is <unchanged>.

                    case 'c':
                        const Cresult = Array.from(Array(N), () => new Array(M).fill('-'));

                        let playerX = 0;
                        let playerY = 0;

                        for (let i = 0; i < result.length; i++) {
                            for (let j = 0; j < result[i].length; j++) {

                                if (result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g') {

                                    var Y = result.length - 1 - i;

                                    if (Cresult[j][Y] === player.toString()) {

                                    } else {

                                        Cresult[j][Y] = result[i][j];

                                    }

                                } else if (result[i][j] === player.toString()) {

                                    var needbreak = false;
                                    for (let k = j + 1; k < result[i].length; k++) {

                                        if (result[i][k] === 'g') {
                                            //goal is reached, return the solved maze
                                            playerX = k;
                                            playerY = result.length - 1 - i;
                                            needbreak = true;
                                        }

                                        if (result[i][k] === 'x' && !needbreak) {
                                            //goal is not reached, keep doing until exhaust moves
                                            playerX = k - 1;
                                            playerY = result.length - 1 - i;
                                            if (playerX > N || playerY > M || playerX < 0 || playerY < 0) {

                                            }
                                            needbreak = true;
                                        }

                                    }
                                    Cresult[playerX][playerY] = result[i][j];
                                    if (j === playerX && result.length - 1 - i === playerY) {
                                        // return maze;
                                    } else {
                                        Cresult[j][result.length - 1 - i] = '-';
                                    }
                                    if ((playerX === i && playerY === j) || (playerX === j && playerY === result.length - 1 - i)) {
                                        // return maze;
                                    }
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
                        for (let i = 0; i < result.length; i++) {
                            for (let j = 0; j < result[i].length; j++) {
                                if (result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g') {
                                    // the piece other than player stays fixed but relative index change

                                    var X = result[i].length - 1 - j;

                                    if (CCresult[X][i] === player.toString()) {


                                    } else {
                                        CCresult[X][i] = result[i][j];
                                    }

                                } else if (result[i][j] === player.toString()) {

                                    // if there's no x, can move
                                    let YafterRotate = 0;
                                    let XafterRotate = 0;
                                    let playerMoves = 0;
                                    var needbreak = false;
                                    for (let k = j - 1; k >= 0; k--) {
                                        if (result[i][k] === 'g' && !needbreak) {
                                            XafterRotate = N - k - 1;
                                            YafterRotate = i;
                                            needbreak = true;
                                        }
                                        if (result[i][k] === 'x' && !needbreak) {//block in the way
                                            const YbeforeRotate = k + 1;
                                            YafterRotate = i;
                                            XafterRotate = result[i].length - 1 - YbeforeRotate;
                                            playerMoves = j - YbeforeRotate;
                                            needbreak = true;
                                        }
                                    }

                                    CCresult[XafterRotate][YafterRotate] = result[i][j];

                                    if (result[i].length - 1 - j === XafterRotate && i === YafterRotate) {
                                        CCresult[result[i].length - 1 - j][i] = result[i][j];
                                    } else {
                                        CCresult[result[i].length - 1 - j][i] = '-';
                                    }

                                    if ((XafterRotate === i && YafterRotate === j)) {
                                        // player not move
                                        var X = result[i].length - 1 - j;
                                        CCresult[X][i] = result[i][j];
                                    }
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

                        for (var r = 0; r < result.length; r++) {
                            for (var c = 0; c < result[r].length; c++) {//correct indexing
                                if (result[r][c] === 'x' || result[r][c] === '-' || result[r][c] === 'g') {
                                    let resulti = result.length - 1 - r;
                                    let resultj = result[r].length - 1 - c;
                                    flipResult[resulti][resultj] = result[r][c];
                                }
                                if (result[r][c] === player.toString()) {
                                    var originplayerXFlip = result.length - 1 - r;
                                    var originplayerYFlip = result[r].length - 1 - c;
                                    flipResult[originplayerXFlip][originplayerYFlip] = '-';

                                    for (let k = r - 1; k >= 0; k--) {
                                        if (result[k][c] === 'x') {
                                            var playerNewX = result.length - 1 - (k + 1);
                                            var playerNewY = result[r].length - 1 - c;
                                            flipResult[playerNewX][playerNewY] = result[r][c];
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                        for (var c = 0; c < flipResult[0].length; c++) {
                            if (flipResult[0][c] === '-') {
                                flipResult[0][c] = '';
                            }
                        }
                        result = flipResult;
                        break;
                }
                // console.log("result after one move: ")
                // helpers.printMaze(result)
            }
        }

        for (let r = 0; r < result.length; r++){
            if(result[r][0] === '-'){
                result[r][0] = '';
            }
            else if(result[r][result[r].length - 1] === '-'){
                result[r][result[r].length - 1] = '-';
            }
        }
        for(let c = 0; c<result[0].length; c++){
            if(result[0][c] === '-'){
                result[0][c] = '';
            }
        }
        return result;
    }

    return whatever;
}
