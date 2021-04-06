module Helpers
( readGravityMazeFile
, printMaze
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

printMaze :: [[Char]] -> IO ()
printMaze [] = do
 print ""
printMaze (ro:ros) = do
 print ro
 printMaze rosmymap :: (a->b) -> [a] ->[b] -- apply function for each element in List
mymap _ []    = []
mymap f (h:t) = (f h):(mymap f t) -- apply function on the head of the list and recursive the rest
findItem :: Eq a => a -> [a] -> [Int] -- return list of index which find the item(0 based indexing)
findItem e list = (findHelper e list 0)
findHelper :: Eq a => a -> [a] -> Int -> [Int] -- => means loop works on every Eq a
findHelper _ [] _ = []
findHelper e (h:t) i
          | (e == h) = i:(findHelper e t (i + 1)) -- find the item at head, put current index at head, and find rest list
          | otherwise= (findHelper e t (i + 1)) -- didn't find , increament index keep finding

