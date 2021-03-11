

prefix :: [a] -> [a]
-- all but last element of a list
-- prefix "abcd" = "abc"
prefix [_] = []
prefix (h:t) = h:(prefix t)
