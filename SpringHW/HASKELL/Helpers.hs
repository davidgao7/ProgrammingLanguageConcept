module Helpers
( readGravityMazeFile,
printMaze ,
printMove,
mymap,
findItem,
replace1DListAtIndex,
replace2DListAtIndex,
cPlayer,
ccPlayer,
isPlayer,
member,
clockwise,
moveRight,
clearPlayerPerviousPosition,
clear1dPlayerPerviousPosition,
getPlayerMoveRightResult,
moveLeft,
getPlayerMoveLeftResult
-- cclockwise,
-- flipwise,
-- clockwiseAll,
-- flipAll,
-- cclockwiseAll
) where

import Prelude
import Data.Char
import Data.List

-- clockwiseAll :: [[Char]] -> [[Char]] --TODO: loop all peg with its index
-- clockwiseAll maze = clockwise maze

-- cclockwiseAll :: [[Char]] -> [[Char]] --TODO: loop all peg with its index
--
-- flipAll :: [[Char]] -> [[Char]] --TODO: loop all peg with its index

-- clockwise ["xxxxx", "xx1-x", "xx-xx", "xxxxx"] 1 2

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

mymap :: (a->b) -> [a] ->[b] -- apply function for each element in List
mymap _ []    = []
mymap f (h:t) = (f h):(mymap f t) -- apply function on the head of the list and recursive the rest

findItem :: Eq a => a -> [a] -> [Int] -- return list of index which find the item(0 based indexing)
findItem e list = (findHelper e list 0)

findHelper :: Eq a => a -> [a] -> Int -> [Int] -- => means loop works on every Eq a
findHelper _ [] _ = []
findHelper e (h:t) i
          | (e == h) = i:(findHelper e t (i + 1)) -- find the item at head, put current index at head, and find rest list
          | otherwise= (findHelper e t (i + 1)) -- didn't find , increament index keep finding

clearPlayerPerviousPosition :: [[Char]] -> Int -> Int -> [[Char]]
clearPlayerPerviousPosition maze x y = replace2DListAtIndex maze x y '-'

clear1dPlayerPerviousPosition :: [Char] -> Int -> [Char]
clear1dPlayerPerviousPosition maze i = replace1DListAtIndex maze i '-'

moveRight :: [Char] -> Int -> Char ->[Char]
moveRight [] _ _ = []
moveRight [e] _ _ = [e]
moveRight list n player
 | (list !! n /= 'x') = moveRight list (n+1) player
 | otherwise = replace1DListAtIndex list (n-1) player

moveLeft :: [Char] -> Int -> Char ->[Char]
moveLeft [] _ _ = []
moveLeft [e] _ _ = [e]
moveLeft list n player
 | (list !! n /= 'x') = moveLeft list (n-1) player
 | otherwise = replace1DListAtIndex list (n+1) player

getPlayerMoveLeftResult :: [Char] -> Int -> Char-> [Char] -- WORK
getPlayerMoveLeftResult line n player
 | (line !! (n-1) /= 'x') = clear1dPlayerPerviousPosition (moveLeft line n player) n
 | otherwise = line

getPlayerMoveRightResult :: [Char] -> Int -> Char-> [Char] -- WORK
getPlayerMoveRightResult line n player
 | (line !! (n+1) /= 'x') = clear1dPlayerPerviousPosition (moveRight line n player) n
 | otherwise = line

clockwise :: [[Char]] -> Int -> Int -> [[Char]]
clockwise maze x y
 | ((x == mazeLength - 1) && (y == lineLength - 1)) = maze -- finish all position in maze (WORK)
 | ((maze !! x !! y == 'x') || (maze !! x !! y == '-') || (maze !! x !! y == 'g')) = clockwise maze x (y + 1) ++ (drop (x + 1) (replace2DListAtIndex maze y (subtract x (mazeLength - 1)) (maze !! x !! y)))
 | (isPlayer(maze !! x !! y)) = clockwise maze x (y + 1) ++ (drop (x + 1) (cPlayer maze x y (maze !! x !! y)))

 where
  lineLength = length(maze !! x)
  mazeLength = length(maze)

cPlayer :: [[Char]] -> Int -> Int -> Char -> [[Char]]
cPlayer maze x y player
  | maze !! x !! (y + 1) == '-' = cPlayer maze x (y + 1) player
  | maze !! x !! (y + 1) == 'x' = replace2DListAtIndex maze y (subtract x (length(maze) - 1)) player


ccPlayer :: [[Char]] -> Int -> Int -> Char -> [[Char]]
ccPlayer maze x y player
  | maze !! x !! (y + 1) == '-' = ccPlayer maze x (y - 1) player
  | maze !! x !! (y + 1) == 'x' = replace2DListAtIndex maze y (subtract y (length(maze !! 0) - 1)) player


replace1DListAtIndex :: [Char] -> Int -> Char -> [Char] -- WORK
replace1DListAtIndex "" _ _ = ""
replace1DListAtIndex [e1] 0 e2 = [e2]
replace1DListAtIndex list n e2
  | list !! n == e2 = list
  | otherwise = take n list ++ [e2] ++ drop (n + 1) list

replace2DListAtIndex :: [[Char]] -> Int -> Int -> Char -> [[Char]] -- WORK
replace2DListAtIndex [""] _ _ _ = [""]
replace2DListAtIndex (row:rest) r c e
  | (r==0)    = [replace1DListAtIndex row c e] ++ rest
  | otherwise = [row] ++ replace2DListAtIndex rest (r - 1) c e
