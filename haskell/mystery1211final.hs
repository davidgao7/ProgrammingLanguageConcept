mystery1211final :: [a] -> [a]
mystery1211final [] = []
mystery1211final [a] = [a]
mystery1211final (h:t) = [n] ++ [h] ++ (mystery1211final r)
  where
    n = head t
    r = tail t
