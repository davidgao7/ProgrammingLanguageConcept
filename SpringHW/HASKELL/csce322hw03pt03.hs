import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Char
import Helpers

-- The main method that will be used for testing / command line access
main = do
 args <- getArgs
 filename <- readFile (head args)
 (maze,moves) <- readGravityMazeFile filename
 print "Result"
 printMaze (manyPlayersManyRotations maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
manyPlayersManyRotations :: [[Char]] -> [[Char]] -> [[Char]]
manyPlayersManyRotations maze [] = maze
manyPlayersManyRotations []   _  = []
manyPlayersManyRotations maze (move:moves)
 | (not (hasgoal maze)) = maze -- if goal is encountered, players make none of the remaining moves
 | otherwise            = manyPlayersManyRotations (manyPlayersManyRotationswithOneMove maze move) moves
-- 1st move for player1, 2nd move for player 2... accordance to onePlayerOneRotation
-- when a player makes a move, all of the other players are also fall until they stop
manyPlayersManyRotationswithOneMove :: [[Char]] -> [Char] -> [[Char]]
manyPlayersManyRotationswithOneMove maze move
 | (move == "c")  = getMultiPlayerClockwise maze
 | (move == "cc") = getMultiPlayerCClockwise maze
 | (move == "180")= getMultiPlayerFlipwise maze
 | otherwise      = maze
