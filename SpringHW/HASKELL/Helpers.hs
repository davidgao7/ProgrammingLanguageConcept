module Helpers
(
readGravityMazeFile,
printMaze,
printMove,
replace1DListAtIndex,
replace2DListAtIndex,
moveUp,
moveRight,
-------------------------------------------------
moveLeft,
clear1dPlayerPerviousPosition,
clearPlayerPerviousPosition,
member,
isPlayer,
append1dListRowWise,
getPlayerMoveLeftResult,
getPlayerMoveRightResult,
getPlayerMoveUpResult,
append1dListTo2dListRowWise,
movePlayerLeftBeforeRotate,
movePlayerRightBeforeRotate,
mazeBeforeRotateMovePlayerLeft,
mazeBeforeRotateMovePlayerRight,
getcolumn,
backward,
cclockwiseMaze,
clockwiseMaze,
flipwiseMaze,
clockwiseMazeResult,
-------------------------------------------------
cclockwiseMazeResult,
flipMazewithouIndexAsInput,
-------------------------------------------------
find1dPlayerPosition,
find2dPlayerPostion,
clockwiseMazewithoutPlayerIndexAsInput,
-------------------------------------------------
cclockwiseMazewithoutPlayerIndexAsInput,
-------------------------------------------------
hasgoalLine,
hasgoal,
findPlayers,
-------------------------------------------------
find2dMultiPlayersPostion,
multiPlayerMoveUp,
multiPlayerMoveLeft,
multiPlayerMoveRight,
getMultiPlayerMoveLeftResult,
getMultiPlayerMoveRightResult,
getMultiPlayerMoveUpResult,
intToChar,
getMultiPlayerClockwise,
getMultiPlayerCClockwise,
getMultiPlayerFlipwise
)
where
 import Prelude
 import Data.Char
 import Data.List
 -------------------------------------------------
 readGravityMazeFile :: String -> IO ([[Char]],[[Char]])
 readGravityMazeFile = readIO
 -------------------------------------------------
 printMaze :: [[Char]] -> IO ()
 printMaze [] = do
  print ""
 printMaze (ro:ros) = do
  print ro
  printMaze ros
 -------------------------------------------------
 printMove :: [[Char]] -> IO ()
 printMove [] = do
  print ""
 printMove (h:rest) = do
  print h
  printMove rest
 -------------------------------------------------
 replace1DListAtIndex :: [Char] -> Int -> Char -> [Char] -- WORK
 replace1DListAtIndex "" _ _ = ""
 replace1DListAtIndex [e1] 0 e2 = [e2]
 replace1DListAtIndex list n e2
  | list !! n == e2 = list
  | otherwise       = take n list ++ [e2] ++ drop (n + 1) list
 -------------------------------------------------
 replace2DListAtIndex :: [[Char]] -> Int -> Int -> Char -> [[Char]] -- WORK
 replace2DListAtIndex [""] _ _ _ = [""]
 replace2DListAtIndex (row:rest) r c e
  | (r==0)    = [replace1DListAtIndex row c e] ++ rest
  | otherwise = [row] ++ replace2DListAtIndex rest (r - 1) c e
 -------------------------------------------------
 moveUp :: [[Char]] -> Int -> Int -> Char -> [[Char]] --WORK
 moveUp [] _ _ _ = []
 moveUp [d1list] _ _ _ = [d1list]
 moveUp maze x y player
  | ((maze !! (x-1) !! y /= 'x') && (maze !! (x-1) !! y /= 'g'))= moveUp maze (x-1) y player -- Not 'x',not 'g' so can move up
  | (maze !! (x-1) !! y == 'g') = replace2DListAtIndex maze (x-1) y player -- meet goal, stop
  | otherwise                   = replace2DListAtIndex maze x y player
 -------------------------------------------------
 moveRight :: [Char] -> Int -> Char ->[Char] --WORK
 moveRight [] _ _ = []
 moveRight [e] _ _ = [e]
 moveRight list n player
  | ((list !! (n+1) /= 'x') && (list !! n /= 'g')) = moveRight list (n+1) player -- Not 'x', not 'g' so can moveright
  | otherwise                                      = replace1DListAtIndex list n player
 -------------------------------------------------
 moveLeft :: [Char] -> Int -> Char ->[Char] --WORK
 moveLeft [] _ _ = []
 moveLeft [e] _ _ = [e]
 moveLeft list n player
  | ((list !! (n-1) /= 'x') && (list !! n /= 'g')) = moveLeft list (n-1) player
  | otherwise                                      = replace1DListAtIndex list n player
 -------------------------------------------------
 clear1dPlayerPerviousPosition :: [Char] -> Int -> [Char] -- WORK
 clear1dPlayerPerviousPosition maze i = replace1DListAtIndex maze i '-'
 -------------------------------------------------
 clearPlayerPerviousPosition :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 clearPlayerPerviousPosition maze x y = replace2DListAtIndex maze x y '-'
 -------------------------------------------------
 member :: Eq a => a -> [a] -> Bool -- WORK
 member _ [] = False
 member e (h:t) = e == h || (member e t)
 -------------------------------------------------
 isPlayer :: Char -> Bool -- WORK
 isPlayer letter = (member letter "0123456789")
 -------------------------------------------------
 append1dListRowWise :: [Char] -> [Char] -> [[Char]] -- WORK
 append1dListRowWise row1 row2 = [row1] ++ [row2]
 -------------------------------------------------
 getPlayerMoveLeftResult :: [Char] -> Int -> Char-> [Char] -- WORK
 getPlayerMoveLeftResult line n player
  | (line !! (n-1) /= 'x') = clear1dPlayerPerviousPosition (moveLeft line n player) n
  | otherwise              = line
 -------------------------------------------------
 getPlayerMoveRightResult :: [Char] -> Int -> Char-> [Char] -- WORK
 getPlayerMoveRightResult line n player
  | (line !! (n+1) /= 'x') = clear1dPlayerPerviousPosition (moveRight line n player) n
  | otherwise              = line
 -------------------------------------------------
 getPlayerMoveUpResult :: [[Char]] -> Int -> Int -> Char -> [[Char]]
 getPlayerMoveUpResult maze x y player
  | (maze !! (x-1) !! y /= 'x') = clearPlayerPerviousPosition (moveUp maze x y player) x y
  | otherwise                   = maze -- not move
 -------------------------------------------------
 append1dListTo2dListRowWise :: [Char] -> [[Char]] -> [[Char]] -- WORK
 append1dListTo2dListRowWise moveResult fragMaze = fragMaze ++ [moveResult]
 -------------------------------------------------
 -- *Helpers> movePlayerLeftBeforeRotate "x---1x" 4 '1' ["x----x","xxxxxx"]
 -- ["x----x","xxxxxx","x1---x"]
 movePlayerLeftBeforeRotate :: [Char] -> Int -> Char -> [[Char]] -> [[Char]] -- WORK
 movePlayerLeftBeforeRotate playerRow n player perviousRows = append1dListTo2dListRowWise (getPlayerMoveLeftResult playerRow n player) perviousRows
 -------------------------------------------------
 -- *Helpers> movePlayerRightBeforeRotate "x1---x" 1 '1' ["x----x","xxxxxx"]
 -- ["x----x","xxxxxx","x---1x"]
 movePlayerRightBeforeRotate :: [Char] -> Int -> Char -> [[Char]] -> [[Char]] -- WORK
 movePlayerRightBeforeRotate playerRow n player perviousRows = append1dListTo2dListRowWise (getPlayerMoveRightResult playerRow n player) perviousRows
 -------------------------------------------------
 -- *Helpers> mazeBeforeRotateMovePlayerLeft ["xxxx", "x----1x", "xxxx"] 1 5
 -- ["xxxx","x1----x","xxxx"]
 mazeBeforeRotateMovePlayerLeft :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 mazeBeforeRotateMovePlayerLeft maze playerX playerY = (movePlayerLeftBeforeRotate (maze!!playerX) playerY (maze!!playerX!!playerY) (take playerX maze)) ++ (drop (playerX+1) maze)
 -------------------------------------------------
 -- *Helpers> mazeBeforeRotateMovePlayerRight ["xxxx", "x1----x", "xxxx"] 1 1
 -- ["xxxx","x----1x","xxxx"]
 mazeBeforeRotateMovePlayerRight :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 mazeBeforeRotateMovePlayerRight maze playerX playerY = (movePlayerRightBeforeRotate (maze!!playerX) playerY (maze!!playerX!!playerY) (take playerX maze)) ++ (drop (playerX+1) maze)
 -------------------------------------------------
 -- ["xxxx","x-1x", "xxxx"] 0 => ["xxx"]
 getcolumn :: [[Char]] -> Int -> [Char] -- WORK
 getcolumn [] _       = []
 getcolumn (h:rest) n = [h!!n] ++ (getcolumn rest n)
 -------------------------------------------------
 backward :: [Char] -> [Char] -- WORK
 backward []       = []
 backward (h:rest) = backward rest ++ [h]
 -------------------------------------------------
 -- *Helpers> cclockwiseMaze ["xxxx", "x1-x", "xxxx"] 0
 -- ["xxx","x-x","x1x","xxx"]
 cclockwiseMaze :: [[Char]] -> Int -> [[Char]] --WORK
 cclockwiseMaze maze n
  | ((n+1) > length(maze!!0)) = []
  | otherwise                 = [getcolumn maze (length(maze!!0)-(n+1))] ++ (cclockwiseMaze maze (n+1))
 -------------------------------------------------
 -- no need to consider player move (palyer already move)
 clockwiseMaze :: [[Char]] -> Int -> [[Char]] -- TODO: not performing correct
 clockwiseMaze mazeAfterplayerMove n -- n starts from 0
  | ((n+1) > length(mazeAfterplayerMove!!0)) = [] -- finish loop through all token in maze
  | otherwise                                = [(backward (getcolumn mazeAfterplayerMove n))] ++ (clockwiseMaze mazeAfterplayerMove (n+1))
 -------------------------------------------------
 -- no need to consider player move
 -- *Helpers> [backward (["xxxx","xx-x","xg1x","xxxx"] !! 3)]
 -- ["xxxx"]
 -- *Helpers> [backward (["xxxx","xx-x","xg1x","xxxx"] !! 2)]
 -- ["x1gx"]
 -- *Helpers> [backward (["xxxx","xx-x","xg1x","xxxx"] !! 3)] ++ [backward (["xxxx","xx-x","xg1x","xxxx"] !! 2)]
 -- ["xxxx","x1gx"]
--  *Helpers> flipwiseMaze ["xxxx","xx1x","xg-x","xxxx"] 0
-- ["xxxx","x-gx","x1xx","xxxx"]
 flipwiseMaze :: [[Char]] -> Int -> [[Char]] --WORK
 flipwiseMaze mazeAfterplayerMove n             -- n starts with 0
  | ((n+1) > length(mazeAfterplayerMove)) = []
  | otherwise                             = [backward (mazeAfterplayerMove !! (length(mazeAfterplayerMove)-(n+1)))] ++ (flipwiseMaze mazeAfterplayerMove (n+1))
 -------------------------------------------------
 -- *Helpers> clockwiseMaze (mazeBeforeRotateMovePlayerRight ["xxxx", "x1-x", "xxxx"] 1 1) 0
 -- ["xxx","x-x","x1x","xxx"]
 --  *Helpers> clockwiseMazeResult ["xxxx", "x1-x", "xxxx"] 1 1
 -- ["xxx","x-x","x1x","xxx"]
 clockwiseMazeResult :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 clockwiseMazeResult maze playerX playerY = clockwiseMaze (mazeBeforeRotateMovePlayerRight maze playerX playerY) 0
 -------------------------------------------------
 -- cclockwiseMaze (mazeBeforeRotateMovePlayerLeft ["xxxx", "x-1x", "xxxx"] 1 2) 0
 -- ["xxx","x-x","x1x","xxx"]
 -- *Helpers> cclockwiseMazeResult ["xxxx", "x-1x", "xxxx"] 1 2
 -- ["xxx","x-x","x1x","xxx"]
 cclockwiseMazeResult :: [[Char]] -> Int -> Int -> [[Char]] -- WORK
 cclockwiseMazeResult maze playerX playerY = cclockwiseMaze (mazeBeforeRotateMovePlayerLeft maze playerX playerY) 0
 -------------------------------------------------
 -- *Helpers> find1dPlayerPosition "x-1x" 0
 -- 2
 -- *Helpers> find1dPlayerPosition "x----xxx1x" 0
 -- 8
 find1dPlayerPosition :: [Char] -> Int -> Int -- WORK
 find1dPlayerPosition row idx
  | (idx > (length(row)-1))                     = -1 -- cannot find player
  | ((row !! idx /= 'x') && (row !! idx /= '-') && (row !! idx /= 'g'))= idx
  | otherwise                                   = find1dPlayerPosition row (idx+1)
 -------------------------------------------------
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
 -------------------------------------------------
 -- *Helpers> clockwiseMazeResult ["xxxx", "x1-x", "xxxx"] ((find2dPlayerPostion ["xxxx", "x1-x", "xxxx"] 0)!!0) ((find2dPlayerPostion ["xxxx", "x1-x", "xxxx"] 0)!!1)
 -- ["xxx","x-x","x1x","xxx"]
 clockwiseMazewithoutPlayerIndexAsInput :: [[Char]] -> [[Char]] -- WORK
 clockwiseMazewithoutPlayerIndexAsInput maze = clockwiseMazeResult maze ((find2dPlayerPostion maze 0)!!0) ((find2dPlayerPostion maze 0)!!1)
 -------------------------------------------------
 cclockwiseMazewithoutPlayerIndexAsInput :: [[Char]] -> [[Char]] -- WORK
 cclockwiseMazewithoutPlayerIndexAsInput maze = cclockwiseMazeResult maze ((find2dPlayerPostion maze 0)!!0) ((find2dPlayerPostion maze 0)!!1)
 -------------------------------------------------
 flipMazewithouIndexAsInput :: [[Char]] -> [[Char]] -- WORK
 flipMazewithouIndexAsInput maze = flipwiseMaze mazeAfterplayerMove 0
                                   where
                                    mazeAfterplayerMove = getPlayerMoveUpResult maze x y player
                                    x                   = (find2dPlayerPostion maze 0)!!0
                                    y                   = (find2dPlayerPostion maze 0)!!1
                                    player              = maze !! x !! y
 -- flipMazewithouIndexAsInput maze = flipwiseMaze (getPlayerMoveUpResult maze ((find2dPlayerPostion maze 0)!!0) ((find2dPlayerPostion maze 0)!!1) maze!!((find2dPlayerPostion maze 0)!!0)!!((find2dPlayerPostion maze 0)!!1)) 0
 -------------------------------------------------
 hasgoalLine :: [Char] -> Bool -- WORK
 hasgoalLine (h:rest)
  | (h == 'g')   = True -- find goal
  | (rest == []) = False -- exahaust list and no goal
  | otherwise    = hasgoalLine rest

 hasgoal :: [[Char]] -> Bool -- WORK
 hasgoal [] = False
 hasgoal (row:rest) = ((hasgoalLine row) || (hasgoal rest))
 -------------------------------------------------
 findPlayers :: [[Char]] ->Int -> Int ->[Char] -- WORK
 findPlayers [] _ _ = []
 findPlayers maze x y
  | (x > (length(maze)-1))                                               = [] -- go through all maze
  | (isPlayer(maze !! x !! y))                                           = [maze !! x !! y] ++ (findPlayers maze x (y+1)) -- find in col
  | (((x+1)<(length(maze)-1)) && ((y+1)>=(length(maze!!x)-1)))           = findPlayers maze (x+1) 0 -- find next row
  | ((not(isPlayer(maze !! x !! y))) && ((y+1) < (length(maze !! x)-1))) = findPlayers maze x (y+1) -- not find in col
  | otherwise                                                            = []
 -------------------------------------------------
--  *Helpers> find2dMultiPlayersPostion ["xxxxxx", "x----x","x----x","xx-1xx","x--2-x","x----x3x----x","x--xg4x","xxxxxx"] 0 0
-- [
-- [1,3,3], ==> [player,x,y]
-- [2,4,3],
-- [3,5,6],
-- [4,6,5]
--]
-- *Helpers> find2dMultiPlayersPostion ["xxxxxx", "x----x","x----x","xx-3xx","x--1-x","x----x4x----x","x--xg2x","xxxxxx"] 0 0
-- [[3,3,3],[1,4,3],[4,5,6],[2,6,5]] order doesn't matter
 find2dMultiPlayersPostion :: [[Char]] -> Int -> Int -> [[Int]] -- same player order with findPlayers -- WORK
 find2dMultiPlayersPostion [] _ _ = []
 find2dMultiPlayersPostion maze x y
  | (x > (length(maze)-1))                                               = [] -- go through all maze
  -------------------------------------------------
  | (isPlayer(maze !! x !! y))                                           = [[digitToInt (maze !! x !! y)]++[x]++[y]] ++ find2dMultiPlayersPostion maze x (y+1) -- find in col
  | (((x+1)<(length(maze)-1)) && ((y+1)>=(length(maze!!x)-1)))           = find2dMultiPlayersPostion maze (x+1) 0 -- find next row
  | ((not(isPlayer(maze !! x !! y))) && ((y+1) < (length(maze !! x)-1))) = find2dMultiPlayersPostion maze x (y+1) -- not find in col
  | otherwise                                                            = []
 -------------------------------------------------
--  *Helpers> multiPlayerMoveUp ["xxxx", "x--x", "x12x", "xxxx"] [[1,2,1],[2,2,2]]
-- ["xxxx","x12x","x--x","xxxx"]
-- *Helpers>  multiPlayerMoveUp ["xxxx", "x3-x", "x12x", "xxxx"] [[1,2,1],[2,2,2],[3,1,1]]
-- ["xxxx","x32x","x1-x","xxxx"]
 multiPlayerMoveUp :: [[Char]] -> [[Int]] -> [[Char]] -- WORK
 multiPlayerMoveUp [] _                              = []
 multiPlayerMoveUp maze []                           = maze
 multiPlayerMoveUp maze (playerXNameAndPostion:rest) = multiPlayerMoveUp mazeAfterOnePlayerMoveUp rest
                                                       where
                                                         mazeAfterOnePlayerMoveUp
                                                          | (maze !! (playerX-1) !! playerY == 'x') || (isPlayer(maze !! (playerX-1) !! playerY)) = maze
                                                          | otherwise                                                                             = clearPlayerPerviousPosition (moveUp maze playerX playerY playerName) playerX playerY
                                                         playerName = intToChar(playerXNameAndPostion!!0)
                                                         playerX    = playerXNameAndPostion!!1
                                                         playerY    = playerXNameAndPostion!!2
 -------------------------------------------------
--  *Helpers> multiPlayerMoveLeft ["xxxx","x-1x","x-2x","xxxx"] [[1,1,2],[2,2,2]]
-- ["xxxx","x1-x","x2-x","xxxx"]
-- *Helpers> multiPlayerMoveLeft ["xxxx","x-1x","x2-x","xxxx"] [[1,1,2],[2,2,1]]
-- ["xxxx","x1-x","x2-x","xxxx"]
 multiPlayerMoveLeft :: [[Char]] -> [[Int]] -> [[Char]] -- WORK
 multiPlayerMoveLeft [] _                              = []
 multiPlayerMoveLeft maze []                           = maze
 multiPlayerMoveLeft maze (playerXNameAndPostion:rest) = multiPlayerMoveLeft mazeAfterOnePlayerMoveLeft rest
                                                         where
                                                           mazeAfterOnePlayerMoveLeft
                                                            | (maze !! playerX !! (playerY-1) == 'x') || (isPlayer(maze !! playerX !! (playerY-1))) = maze -- not move when other player or x in the way
                                                            | otherwise                                                                             = mazeBeforeRotateMovePlayerLeft maze playerX playerY
                                                           playerName      = intToChar(playerXNameAndPostion!!0)
                                                           playerX         = playerXNameAndPostion!!1
                                                           playerY         = playerXNameAndPostion!!2
 -------------------------------------------------
 multiPlayerMoveRight :: [[Char]] -> [[Int]] -> [[Char]] -- WORK
 multiPlayerMoveRight [] _                              = []
 multiPlayerMoveRight maze []                           = maze
 multiPlayerMoveRight maze (playerXNameAndPostion:rest) = multiPlayerMoveRight mazeAfterOnePlayerMoveRight rest
                                                          where
                                                            mazeAfterOnePlayerMoveRight
                                                             | ((maze !! playerX !! (playerY+1) == 'x') || (isPlayer(maze !! playerX !! (playerY+1)))) = maze
                                                             | otherwise                                                                               = mazeBeforeRotateMovePlayerRight maze playerX playerY
                                                            playerName      = intToChar(playerXNameAndPostion!!0)
                                                            playerX         = playerXNameAndPostion!!1
                                                            playerY         = playerXNameAndPostion!!2
 -------------------------------------------------
 getMultiPlayerMoveLeftResult :: [[Char]] -> [[Char]] -- WORK
 getMultiPlayerMoveLeftResult maze = multiPlayerMoveLeft maze (find2dMultiPlayersPostion maze 0 0)
 -------------------------------------------------
 getMultiPlayerMoveRightResult :: [[Char]] -> [[Char]] -- TODO: check this before moving further
 getMultiPlayerMoveRightResult maze = multiPlayerMoveRight maze (find2dMultiPlayersPostion maze 0 0)
 -------------------------------------------------
 getMultiPlayerMoveUpResult :: [[Char]] -> [[Char]] -- TODO: check this before moving further
 getMultiPlayerMoveUpResult maze = multiPlayerMoveUp maze (find2dMultiPlayersPostion maze 0 0)
 -------------------------------------------------
 intToChar :: Int -> Char --WORK
 intToChar m = (show m) !! 0
-------------------------------------------------
 getMultiPlayerClockwise :: [[Char]] -> [[Char]]
 getMultiPlayerClockwise maze = clockwiseMaze (getMultiPlayerMoveRightResult maze) 0
-------------------------------------------------
 getMultiPlayerCClockwise :: [[Char]] -> [[Char]]
 getMultiPlayerCClockwise maze = cclockwiseMaze (getMultiPlayerMoveLeftResult maze) 0
-------------------------------------------------
 getMultiPlayerFlipwise :: [[Char]] -> [[Char]]
 getMultiPlayerFlipwise maze = flipwiseMaze (getMultiPlayerMoveUpResult maze) 0
