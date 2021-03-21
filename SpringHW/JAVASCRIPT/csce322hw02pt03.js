module.exports = {
    manyPlayersManyRotations: manyPlayersManyRotations
}

var helpers = require('./helpers');

function manyPlayersManyRotations(maze) {

    function whatever(moves) {
        var numberPlayers = helpers.findNumberPlayers(maze);
        var result = maze;
        var player = 1;//start from the first player

        for (var moveIndex = 0; moveIndex < moves.length; moveIndex++) {

            var M = result.length;
            var N = result[0].length;

            if (player > numberPlayers) {
                player = 1;
            }
            var move = moves[moveIndex]
            console.log("maze: ");
            helpers.printMaze(result);
            console.log("player: " + player)
            console.log("move: " + move)
            //=====================//
            switch (move) {

                case 'c':
                    const Cresult = Array.from(Array(result[0].length), () => new Array(result.length).fill('-'));

                    let playerX = 0;
                    let playerY = 0;
                    var playerMoved = new Set([]);

                    for (let i = 0; i < result.length; i++) {
                        for (let j = 0; j < result[i].length; j++) {
                            // other player will act as wall

                            if (result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g' || !helpers.iscurrentPlayer(result[i][j],player)) {
                                //非此player的情况
                                var Y = result.length - 1 - i;
                                if (playerMoved.has(player) && Cresult[j][Y] === player.toString()) {//has move to right position, not touch
                                } else {
                                    var stuffin = result[i][j];

                                    Cresult[j][Y] = stuffin;

                                }


                            } else if (result[i][j] === player.toString()) {

                                var needbreak = false;
                                for (let k = j + 1; k < result[i].length; k++) {

                                    if (result[i][k] === 'g') {

                                        playerX = k;
                                        playerY = result.length - 1 - i;
                                        needbreak = true;
                                    }

                                    var isInt = helpers.isInteger(result[i][k]);

                                    if ((result[i][k] === 'x' || isInt) && !needbreak) {

                                        playerX = k - 1;
                                        playerY = result.length - 1 - i;
                                        if (playerX > N || playerY > M || playerX < 0 || playerY < 0) {
                                            // console.log("player index out of bound! "+ playerX + " " + playerY)
                                        }
                                        needbreak = true;
                                    }

                                }
                                Cresult[playerX][playerY] = result[i][j];
                                playerMoved.add(player);

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
                            if ((result[i][j] === 'x' || result[i][j] === '-' || result[i][j] === 'g') || (result[i][j] !== player.toString())) {
                                // the piece other than player stays fixed but relative index change

                                var X = result[i].length - 1 - j;

                                if (CCresult[X][i] === player.toString()) {

                                    // console.log("meet " + maze[i][j] + " at index [" + i + ", " + j + "], player index in the result array for this current location, index not switching");

                                } else {
                                    CCresult[X][i] = result[i][j];
                                    // console.log("switching index of regular peg, from origin index [" + i + ", " + j + "] to [" + X + " " + i + "]");
                                }
                                // console.log("result after move cc turn: ")
                                // printMaze(CCresult)

                            } else if (result[i][j] === player.toString()) {
                                // console.log("meet player at original maze, player initial index(case cc): %s", i + " " + j);
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
                                        // console.log("player index after move: %s", maze[i].length - 1 - k - 1 + " " + i);
                                        const YbeforeRotate = k + 1;
                                        YafterRotate = i;
                                        XafterRotate = result[i].length - 1 - YbeforeRotate;
                                        playerMoves = j - YbeforeRotate;
                                        needbreak = true;
                                    }
                                }
                                // if (playerMoves >= 1) {
                                // console.log("player initial index in maze: [%s] result index in CCresult: [%s]", i + " " + j, XafterRotate + " " + YafterRotate);
                                CCresult[XafterRotate][YafterRotate] = result[i][j];
                                // console.log("cross out the original player inedx in original maze: make [%s] in CCresult to \'-\'", maze[i].length - 1 - j + " " + i);
                                if (result[i].length - 1 - j === XafterRotate && i === YafterRotate) {
                                    // console.log("player being block, player not move")
                                    CCresult[result[i].length - 1 - j][i] = result[i][j];
                                } else {
                                    CCresult[result[i].length - 1 - j][i] = '-';
                                }

                                if ((XafterRotate === i && YafterRotate === j)) {//TODO: want to maze after move
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
                            if ((result[r][c] === 'x' || result[r][c] === '-' || result[r][c] === 'g') || (result[r][c] !== player.toString())) {
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
                    for (let c = 0; c < flipResult[0].length; c++) {
                        if (flipResult[0][c] === '-') {
                            flipResult[0][c] = '';
                        }
                    }

                    result = flipResult;
                    break;
            }
            console.log("after move(player %d): ", player)

            helpers.printMaze(result)
            console.log("///=================================///")
            //=====================//
            player++;
        }
        return result;
    }

    return whatever;
}
