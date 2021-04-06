module Helpers
( readGravityMazeFile
, printMaze
( readGravityMazeFile,
printMaze ,
printMove,
mymap,
findItem,
replace1DListAtIndex,
moveRight,
clear1dPlayerPerviousPosition,
getPlayerMoveRightResult
) where

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
 printMaze rosmymap :: (a->b) -> [a] ->[b] -- apply function for each element in List
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

clear1dPlayerPerviousPosition :: [Char] -> Int -> [Char]
clear1dPlayerPerviousPosition maze i = replace1DListAtIndex maze i '-'
moveRight :: [Char] -> Int -> Char ->[Char]
moveRight [] _ _ = []
moveRight [e] _ _ = [e]
moveRight list n player
 | (list !! n /= 'x') = moveRight list (n+1) player
 | otherwise = replace1DListAtIndex list (n-1) player
getPlayerMoveRightResult :: [Char] -> Int -> Char-> [Char]
getPlayerMoveRightResult line n player = clear1dPlayerPerviousPosition (moveRight line n player) n
replace1DListAtIndex :: [Char] -> Int -> Char -> [Char] -- WORK
replace1DListAtIndex "" _ _ = ""
replace1DListAtIndex [e1] 0 e2 = [e2]
replace1DListAtIndex list n e2
  | list !! n == e2 = list
  | otherwise = take n list ++ [e2] ++ drop (n + 1) list
