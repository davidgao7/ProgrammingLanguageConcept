import Data.List
-- This function can push vowels to the end of a string 
pushVowels :: [Char] -> [Char]
-- pushVowels "nebraska" = "nbrskeaa"
-- pushVowels "nbc" = "nbc"
-- pushVowels "eue" = "eue"
-- pushVowels "oats" = "tsoa"
-- pushVowels "a" = "a"

-- base case(s)
pushVowels "" = ""
pushVowels [e] = [e]
-- general case
pushVowels (h:t)
 | (not (vowel h)) = h:(pushVowels t) -- don't push head down into tail
 | (not (vowel n)) = n:(pushVowels (h:r)) -- swap head and next, then push head and rest
 | (vowel h) && (vowel n) && (c == []) = h:t -- neighboring vowels, only vowels later
 | otherwise = pushVowels (h:(pushVowels t)) -- neighboring vowels, vowels later
 where n = head t
       r = tail t
       c = [x|x<-r,(not (vowel x))]

member :: Eq a => a -> [a] -> Bool
member _ [] = False -- nothing is a member of an empty list
member e (h:t) = e == h || (member e t) -- something is a member of a list if it is the head or a member of the tail

vowel :: Char -> Bool
vowel letter = (member letter "aeiou")
