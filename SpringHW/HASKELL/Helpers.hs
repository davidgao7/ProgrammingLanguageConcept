module Helpers
( readGravityMazeFile,
printMaze ,
printMove,
replace1DListAtIndex,
replace2DListAtIndex,
-- cPlayer,
-- ccPlayer,
isPlayer,
member,
moveRight,
clearPlayerPerviousPosition,
clear1dPlayerPerviousPosition,
getPlayerMoveRightResult,
moveLeft,
getPlayerMoveLeftResult,
append1dListRowWise,
append1dListTo2dListRowWise,
movePlayerLeftBeforeRotate,
movePlayerRightBeforeRotate,
mazeBeforeRotateMovePlayerLeft,
mazeBeforeRotateMovePlayerRight,
getcol,
clockwiseMaze,
clockwiseMazeResult,
cclockwiseMaze,
cclockwiseMazeResult,
find2dPlayerPostion,
find1dPlayerPosition,
clockwiseMazewithoutPlayerIndexAsInput,
backward
-- cclockwise,
-- flipwise,
-- clockwiseAll,
-- flipAll,
-- cclockwiseAll
)
where
 import Prelude
 import Data.Char
 import Data.List

 member :: Eq a => a -> [a] -> Bool
 member _ [] = False
 member e (h:t) = e == h || (member e t)

 isPlayer :: Char -> Bool
 isPlayer letter = (member letter "0123456789")

 readGravityMazeFile :: String -> IO ([[Char]],[[Char]])
 readGravityMazeFile = readIO

 printMove :: [[Char]] -> IO ()
 printMove [] = do
  print ""
 printMove (h:rest) = do
  print h
  printMove rest

 printMaze :: [[Char]] -> IO ()
 printMaze [] = do
  print ""
 printMaze (ro:ros) = do
  print ro
  printMaze ros

 replace1DListAtIndex :: [Char] -> Int -> Char -> [Char] -- WORK
 replace1DListAtIndex "" _ _ = ""
 replace1DListAtIndex [e1] 0 e2 = [e2]
 replace1DListAtIndex list n e2
  | list !! n == e2 = list
  | otherwise       = take n list ++ [e2] ++ drop (n + 1) list

 replace2DListAtIndex :: [[Char]] -> Int -> Int -> Char -> [[Char]] -- WORK
 replace2DListAtIndex [""] _ _ _ = [""]
 replace2DListAtIndex (row:rest) r c e
  | (r==0)    = [replace1DListAtIndex row c e] ++ rest
  | otherwise = [row] ++ replace2DListAtIndex rest (r - 1) c e

 clearPlayerPerviousPosition :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 clearPlayerPerviousPosition maze x y = replace2DListAtIndex maze x y '-'

 clear1dPlayerPerviousPosition :: [Char] -> Int -> [Char] -- WORK
 clear1dPlayerPerviousPosition maze i = replace1DListAtIndex maze i '-'

 moveRight :: [Char] -> Int -> Char ->[Char] -- WORK
 moveRight [] _ _ = []
 moveRight [e] _ _ = [e]
 moveRight list n player
  | (list !! n /= 'x') = moveRight list (n+1) player
  | otherwise          = replace1DListAtIndex list (n-1) player

 moveLeft :: [Char] -> Int -> Char ->[Char] -- WORK
 moveLeft [] _ _ = []
 moveLeft [e] _ _ = [e]
 moveLeft list n player
  | (list !! n /= 'x') = moveLeft list (n-1) player
  | otherwise          = replace1DListAtIndex list (n+1) player

 getPlayerMoveLeftResult :: [Char] -> Int -> Char-> [Char] -- WORK
 getPlayerMoveLeftResult line n player
  | (line !! (n-1) /= 'x') = clear1dPlayerPerviousPosition (moveLeft line n player) n
  | otherwise              = line

 getPlayerMoveRightResult :: [Char] -> Int -> Char-> [Char] -- WORK
 getPlayerMoveRightResult line n player
  | (line !! (n+1) /= 'x') = clear1dPlayerPerviousPosition (moveRight line n player) n
  | otherwise              = line

 append1dListRowWise :: [Char] -> [Char] -> [[Char]] -- WORK
 append1dListRowWise row1 row2 = [row1] ++ [row2]

 append1dListTo2dListRowWise :: [Char] -> [[Char]] -> [[Char]] -- WORK
 append1dListTo2dListRowWise moveResult fragMaze = fragMaze ++ [moveResult]

 -- *Helpers> movePlayerLeftBeforeRotate "x---1x" 4 '1' ["x----x","xxxxxx"]
 -- ["x----x","xxxxxx","x1---x"]
 movePlayerLeftBeforeRotate :: [Char] -> Int -> Char -> [[Char]] -> [[Char]] -- WORK
 movePlayerLeftBeforeRotate playerRow n player perviousRows = append1dListTo2dListRowWise (getPlayerMoveLeftResult playerRow n player) perviousRows

 -- *Helpers> movePlayerRightBeforeRotate "x1---x" 1 '1' ["x----x","xxxxxx"]
 -- ["x----x","xxxxxx","x---1x"]
 movePlayerRightBeforeRotate :: [Char] -> Int -> Char -> [[Char]] -> [[Char]] -- WORK
 movePlayerRightBeforeRotate playerRow n player perviousRows = append1dListTo2dListRowWise (getPlayerMoveRightResult playerRow n player) perviousRows

 -- *Helpers> mazeBeforeRotateMovePlayerLeft ["xxxx", "x----1x", "xxxx"] 1 5
 -- ["xxxx","x1----x","xxxx"]
 mazeBeforeRotateMovePlayerLeft :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 mazeBeforeRotateMovePlayerLeft maze playerX playerY = (movePlayerLeftBeforeRotate (maze!!playerX) playerY (maze!!playerX!!playerY) (take playerX maze)) ++ (drop (playerX+1) maze)

 -- *Helpers> mazeBeforeRotateMovePlayerRight ["xxxx", "x1----x", "xxxx"] 1 1
 -- ["xxxx","x----1x","xxxx"]
 mazeBeforeRotateMovePlayerRight:: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 mazeBeforeRotateMovePlayerRight maze playerX playerY = movePlayerRightBeforeRotate (maze!!playerX) playerY (maze!!playerX!!playerY) (take playerX maze) ++ (drop (playerX+1) maze)

 backward :: [Char] -> [Char] -- WORK
 backward []       = []
 backward (h:rest) = backward rest ++ [h]

 -- ["xxxx","x-1x", "xxxx"] 0 => ["xxx"]
 getcol :: [[Char]] -> Int -> [Char] -- WORK
 getcol [] _       = []
 getcol (h:rest) n = [h!!n] ++ (getcol rest n)

 -- *Helpers> cclockwiseMaze ["xxxx", "x1-x", "xxxx"] 0
 -- ["xxx","x-x","x1x","xxx"]
 cclockwiseMaze :: [[Char]] -> Int -> [[Char]] --WORK
 cclockwiseMaze maze n
  | ((n+1) > length(maze!!0)) = []
  | otherwise                 = [getcol maze (length(maze!!0)-(n+1))] ++ (cclockwiseMaze maze (n+1))

  -- no need to consider player move (palyer already move)
 clockwiseMaze :: [[Char]] -> Int -> [[Char]] -- WORK
 clockwiseMaze mazeAfterplayerMove n -- n starts from 0
  | ((n+1) > length(mazeAfterplayerMove!!0)) = [] -- finish loop through all token in maze
  | otherwise                                = [(backward (getcol mazeAfterplayerMove n))] ++ (clockwiseMaze mazeAfterplayerMove (n+1))

  -- *Helpers> clockwiseMaze (mazeBeforeRotateMovePlayerRight ["xxxx", "x1-x", "xxxx"] 1 1) 0
 -- ["xxx","x-x","x1x","xxx"]
 --  *Helpers> clockwiseMazeResult ["xxxx", "x1-x", "xxxx"] 1 1
 -- ["xxx","x-x","x1x","xxx"]
 clockwiseMazeResult :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 clockwiseMazeResult maze playerX playerY = clockwiseMaze (mazeBeforeRotateMovePlayerRight maze playerX playerY) 0

 -- cclockwiseMaze (mazeBeforeRotateMovePlayerLeft ["xxxx", "x-1x", "xxxx"] 1 2) 0
 -- ["xxx","x-x","x1x","xxx"]
 -- *Helpers> cclockwiseMazeResult ["xxxx", "x-1x", "xxxx"] 1 2
 -- ["xxx","x-x","x1x","xxx"]
 cclockwiseMazeResult :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 cclockwiseMazeResult maze playerX playerY = cclockwiseMaze (mazeBeforeRotateMovePlayerLeft maze playerX playerY) 0

 -- *Helpers> find1dPlayerPosition "x-1x" 0
 -- 2
 -- *Helpers> find1dPlayerPosition "x----xxx1x" 0
 -- 8
 find1dPlayerPosition :: [Char] -> Int -> Int -- WORK
 find1dPlayerPosition row idx
  | (idx > (length(row)-1))                     = -1 -- cannot find player
  | ((row !! idx /= 'x') && (row !! idx /= '-') && (row !! idx /= 'g'))= idx
  | otherwise                                   = find1dPlayerPosition row (idx+1)

 -- get index of first player seen in 2d maze
 -- *Helpers> find2dPlayerPostion ["xxx", "x-x", "x1x", "xxx"] 0
 -- [2,1]
 -- *Helpers> find2dPlayerPostion ["xxx", "x-x", "x-x", "xxx"] 0
 -- [-1,-1]
 find2dPlayerPostion :: [[Char]] -> Int -> [Int] -- WORK
 find2dPlayerPostion (row:rest) r
  | (length(rest)==0)                  = [-1,-1]-- cannot find player
  | (find1dPlayerPosition row 0 == -1) = find2dPlayerPostion rest (r+1)
  | otherwise                          = [r] ++ [find1dPlayerPosition row 0]

 -- *Helpers> clockwiseMazeResult ["xxxx", "x1-x", "xxxx"] ((find2dPlayerPostion ["xxxx", "x1-x", "xxxx"] 0)!!0) ((find2dPlayerPostion ["xxxx", "x1-x", "xxxx"] 0)!!1)
 -- ["xxx","x-x","x1x","xxx"]
 clockwiseMazewithoutPlayerIndexAsInput :: [[Char]] -> [[Char]] -- WORK
 clockwiseMazewithoutPlayerIndexAsInput maze = clockwiseMazeResult maze ((find2dPlayerPostion maze 0)!!0) ((find2dPlayerPostion maze 0)!!1)

 -- cPlayer :: [[Char]] -> Int -> Int -> Char -> [[Char]]
 -- cPlayer maze x y player
 --  | maze !! x !! (y + 1) == '-' = cPlayer maze x (y + 1) player
 --  | maze !! x !! (y + 1) == 'x' = replace2DListAtIndex maze y (subtract x (length(maze) - 1)) player

 -- ccPlayer :: [[Char]] -> Int -> Int -> Char -> [[Char]]
 -- ccPlayer maze x y player
 --  | maze !! x !! (y + 1) == '-' = ccPlayer maze x (y - 1) player
 --  | maze !! x !! (y + 1) == 'x' = replace2DListAtIndex maze y (subtract y (length(maze !! 0) - 1)) player
