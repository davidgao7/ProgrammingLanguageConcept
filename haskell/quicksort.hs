



quicksort :: Ord e => [e] -> [e]
quicksort [] = []
quicksort (h:t) = (quicksort [lt|lt<-t,lt<=h]) ++ [h] ++ (quicksort [gt|gt<-t,gt>h])
