

dropn :: Int -> [a] -> [a]
-- drop the first n elements from a list
-- dropn 4 "nebraska" = "aska"
dropn 0 list = list
dropn _ [] = []
dropn n (h:t) = dropn (n-1) t
