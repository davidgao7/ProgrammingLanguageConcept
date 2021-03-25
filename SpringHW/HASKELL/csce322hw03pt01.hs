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
 printMaze (onePlayerOneRotation maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneRotation :: [[Char]] -> Char -> [[Char]]

onePlayerOneRotation [] _ = []
onePlayerOneRotation maze move
                    | move == "c"  = clockwise maze
                    | move == "cc" = cclockwise maze
                    | move == "180"= flipwise maze
                    | otherwise    = maze

                    where{
                      clockwise(x,y)
                        | maze[x][y] == 'x' = maze[y][length(maze rows) - 1 - x] = 'x'
                        | maze[x][y] == '-' = maze[y][length(maze rows) - 1 - x] = '-'
                        | maze[x][y] == 'g' = maze[y][length(maze rows) - 1 - x] = 'g'
                        | otherwise playerClockwise maze maze[x][y]
                    }

playerClockwise :: [[Char]] -> Char -> [[Char]] --TODO: 这个方程写完给教授看看 ！！！
playerClockwise []
