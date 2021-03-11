



getIth :: [a] -> Int -> a
getIth (el:els) 0 = el
getIth (el:els) p = getIth els (p-1)

setIth :: [a] -> Int -> a -> [a]
-- setIth [] _ _ = []
setIth [] 0 el = [el]
-- setIth "nebraska" 2 'v' -> "nevraska"
setIth (_:els) 0 newEl = newEl:els
setIth (el:els) p newEl = el:(setIth els (p-1) newEl)

removeIth :: [a] -> Int -> [a]
-- removeIth "nebraska" 2 -> "neraska"
removeIth (_:els) 0 = els
removeIth (el:els) i = el:(removeIth els (i-1))

find1D :: Eq e => [e] -> e -> Int
-- find first instance of something in a list
-- find1D "nebraska" 'a' -> 4
find1D [] _ = -1
find1D (h:t) e
       | h == e		= 0
       | rest == -1	= -1
       | otherwise	= rest + 1
       where rest = find1D t e

findMultiple1D :: Eq e => [e] -> e -> [Int]
-- find all instances of something in a list
-- findMultiple1D "nebraska" 'a' -> [4,7]
findMultiple1D [] _ = []
findMultiple1D (h:t) e
	       | h == e		= 0:(map (+1) rest)
	       | otherwise	= map (+1) rest
	       where rest = findMultiple1D t e

findMultiple2D :: Eq e => [[e]] -> e -> [(Int,Int)]
-- findMultiple2D ["alpha","bravo","charlie"] 'a' = [(0,0),(0,4),(1,2),(2,2)]
findMultiple2D [] _ = []
findMultiple2D (row:rows) el = first ++ next
	       where findFirst = findMultiple1D row el
	       	     first     = [(0,c)|c<-findFirst]
		     findNext  = findMultiple2D rows el
		     next      = map incRow findNext

incRow :: (Int,Int) -> (Int,Int)
incRow (a,b) = (a+1,b)










