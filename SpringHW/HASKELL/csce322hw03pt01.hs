import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / command line access
main = do
 args <- getArgs
 filename <- readFile (head args)
 (maze,moves) <- readGravityMazeFile filename
 -- print "original"
 -- printMaze maze
 -- print "moves"
 -- print (head moves)
 -- print "onePlayerOneRotation: "
 print "Result"
 printMaze (onePlayerOneRotation maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneRotation :: [[Char]] -> [Char] -> [[Char]]

onePlayerOneRotation [] _ = []
onePlayerOneRotation maze move
                    | move == "c"  = clockwiseMazewithoutPlayerIndexAsInput maze
                    | move == "cc" = cclockwiseMazewithoutPlayerIndexAsInput maze
                    -- | move == "180"= flipAll maze
                    | otherwise    = maze
