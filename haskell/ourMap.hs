

ourMap :: (a->b) -> [a] -> [b]
-- ourMap sqrt [1,4,9] = [1,2,3]
ourMap _ [] = []
ourMap f (h:t) = (f h):(ourMap f t)
