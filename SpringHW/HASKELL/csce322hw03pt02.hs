import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / command line access
main = do
 args <- getArgs
 filename <- readFile (head args)
 (maze,moves) <- readGravityMazeFile filename
 print "Result"
 printMaze (onePlayerManyRotations maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerManyRotations :: [[Char]] -> [[Char]] -> [[Char]]
onePlayerManyRotations maze []           = maze
onePlayerManyRotations maze (move:moves)
 | (not (hasgoal maze)) = maze
 | otherwise            = onePlayerManyRotations (onePlayerOneRotation maze move) moves

onePlayerOneRotation :: [[Char]] -> [Char] -> [[Char]]
onePlayerOneRotation [] _ = []
onePlayerOneRotation maze move
                    | move == "c"  = clockwiseMazewithoutPlayerIndexAsInput maze
                    | move == "cc" = cclockwiseMazewithoutPlayerIndexAsInput maze
                    | move == "180"= flipMazewithouIndexAsInput maze
                    | otherwise    = maze
