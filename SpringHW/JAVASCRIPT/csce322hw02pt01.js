module.exports = {
    onePlayerOneRotation: onePlayerOneRotation
}

var helpers = require('./helpers');

function onePlayerOneRotation(maze) {

    function whatever(move) {// single rotation

        const M = maze.length;
        const N = maze[0].length;
        var player = 1;

        switch (move) {

            case 'c':
                const Cresult = Array.from(Array(maze[0].length), () => new Array(maze.length).fill('-'));

                let CplayerX = 0;
                let CplayerY = 0;

                for (let i = 0; i < maze.length; i++) {
                    for (let j = 0; j < maze[i].length; j++) {

                        if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {

                            var Y = maze.length - 1 - i;

                            if (Cresult[j][Y] === player.toString()) {

                            } else {
                                // console.log("token: " + maze[i][j]);
                                // console.log("index: " + i + " " + j);
                                // console.log("index after clockwise: " + j + " " + Y);
                                Cresult[j][Y] = maze[i][j];
                                // console.log("assign normal chess")
                                // console.log("after normal :")
                                // helpers.printMaze(Cresult)
                            }

                        } else if (maze[i][j] === player.toString()) {
                            // console.log("player at original maze: " + i + " " + j);
                            // console.log("see if player can move...");
                            var needbreak = false;
                            for (let k = j + 1; k < maze[i].length; k++) {
                                // console.log("origin maze: from " + i + " " + j + " move to " + i + " " + k);
                                if (maze[i][k] === 'g') {
                                    // console.log("meet goal without road block");
                                    CplayerX = k;
                                    CplayerY = maze.length - 1 - i;
                                    // console.log("player at goal, goal origin index: " + i + " " + k + ", after rotation: " + CplayerX + " " + CplayerY);
                                    needbreak = true;
                                }

                                if (maze[i][k] === 'x' && !needbreak) {
                                    // console.log("meet road block: " + i + " " + k + ", player stop before the road block");
                                    CplayerX = k - 1;
                                    CplayerY = maze.length - 1 - i;
                                    // console.log("player index after rotation: from " + i + " " + j + " to " + CplayerX + " " + CplayerY);
                                    needbreak = true;
                                }

                            }
                            Cresult[CplayerX][CplayerY] = maze[i][j];
                            // console.log("after player moves: ")
                            // helpers.printMaze(Cresult)
                        }

                    }
                }
                for(let r = 0; r<Cresult.length; r++){
                    if(Cresult[r][0]==='-'){
                        Cresult[r][0] = '';
                    }
                }
                return Cresult;

            case 'cc':
                const CCresult = Array.from(Array(maze[0].length), () => new Array(maze.length).fill('-'));

                let CCplayerX = 0;
                let CCplayerY = 0;

                for (let i = 0; i < maze.length; i++) {
                    for (let j = 0; j < maze[i].length; j++) {

                        if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {

                            var CX = maze[i].length - 1 - j;

                            if (CCresult[CX][i] === player.toString()) {

                            } else {
                                // console.log("token: " + maze[i][j]);
                                // console.log("index: " + i + " " + j);
                                // console.log("index after counter-clockwise: " + CX + " " + i);
                                CCresult[CX][i] = maze[i][j];
                                // console.log("assign normal chess")
                                // console.log("after normal :")
                                // helpers.printMaze(CCresult)
                            }

                        } else if (maze[i][j] === player.toString()) {
                            // console.log("player at original maze: " + i + " " + j);
                            // console.log("see if player can move...");
                            var needbreak = false;
                            for (let k = j - 1; k >= 0; k--) {
                                // console.log("origin maze: from " + i + " " + j + " move to " + i + " " + k);
                                if (maze[i][k] === 'g') {
                                    // console.log("meet goal without road block");
                                    CCplayerX = maze[0].length - 1 - k;
                                    CCplayerY = i;
                                    // console.log("player at goal, goal origin index: " + i + " " + k + " , after rotation: " + CCplayerX + " " + CCplayerY);
                                    needbreak = true;
                                }
                                if (maze[i][k] === 'x' && !needbreak) {//block in the way
                                    // console.log("meet road block: " + i + " " + k + ", player stop before the road block");
                                    const YbeforeRotate = k + 1;
                                    CCplayerY = i;
                                    CCplayerX = maze[i].length - 1 - YbeforeRotate;
                                    // console.log("player index after rotation: from " + i + " " + j + " to " + CCplayerX + " " + CCplayerY);
                                    needbreak = true;
                                }
                            }
                            CCresult[CCplayerX][CCplayerY] = maze[i][j];
                            // console.log("after player moves: ")
                            // helpers.printMaze(CCresult)
                        }
                    }
                }
                for(let r = 0; r<CCresult.length; r++){
                    if(CCresult[r][CCresult[r].length-1] === '-'){
                        CCresult[r][CCresult[r].length-1] = '';
                    }
                }
                return CCresult;

            case '180':
                const flipResult = Array.from(Array(M), () => new Array(N).fill('-'));

                let FlipplayerX = 0;
                let FlipplayerY = 0;

                for (var i = 0; i < maze.length; i++) {
                    for (var j = 0; j < maze[i].length; j++) {

                        if (maze[i][j] === 'x' || maze[i][j] === '-' || maze[i][j] === 'g') {

                            let resulti = maze.length - 1 - i;
                            let resultj = maze[i].length - 1 - j;

                            if (flipResult[resulti][resultj] === player.toString()) {

                            } else {
                                // console.log("token: " + maze[i][j]);
                                // console.log("index: " + i + " " + j);
                                // console.log("index after flip 180: " + resulti + " " + resultj);
                                flipResult[resulti][resultj] = maze[i][j];
                                // console.log("assign normal chess")
                                // console.log("after normal: ")
                                // helpers.printMaze(flipResult)
                            }

                        }
                        if (maze[i][j] === player.toString()) {
                            // console.log("player at original maze: " + i + " " + j);
                            // console.log("see if player can move...");
                            var needbreak = false;
                            for (let k = i - 1; k >= 0; k--) {
                                // console.log("origin maze: from " + i + " " + j + " move to " + k + " " + j);
                                if (maze[k][j] === 'g') {
                                    // console.log("meet goal without road block");
                                    FlipplayerX = maze.length - 1 - k;
                                    FlipplayerY = maze[0].length - 1 - j;
                                    // console.log("player at goal, goal origin index: " + i + " " + k + ", after flip 180: " + FlipplayerX + " " + FlipplayerY);
                                    needbreak = true;
                                }
                                if (maze[k][j] === 'x' && !needbreak) {
                                    // console.log("meet road block: " + k + " " + j + ", player stop before the road block");
                                    FlipplayerX = maze.length - 1 - (k + 1);
                                    FlipplayerY = maze[0].length - 1 - j;
                                    // console.log("player index after flip 180: from " + (k+1) + " " + j + " to " + FlipplayerX + " " + FlipplayerY);
                                    needbreak = true;
                                    break;
                                }
                            }
                            flipResult[FlipplayerX][FlipplayerY] = maze[i][j];
                            // console.log("after player moves: ")
                            // helpers.printMaze(flipResult)
                        }
                    }
                }
                for(let c = 0 ; c < flipResult[0].length; c++){
                    if(flipResult[0][c] === '-'){
                        flipResult[0][c] = '';
                    }
                }
                return flipResult;
        }

    }

    return whatever;
}