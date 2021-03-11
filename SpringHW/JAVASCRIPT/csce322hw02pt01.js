module.exports = {
    onePlayerOneRotation: onePlayerOneRotation
}

var helpers = require('./helpers');

function onePlayerOneRotation(maze) {

    function whatever(move) {// single rotation
        return helpers.doSingleRotation(maze, move,1);
    }

    return whatever;
}
