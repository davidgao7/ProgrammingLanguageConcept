evenSum :: Integral i => [i] -> i
-- evenSum [1,2,3,4] = 6
-- evenSum [1,3,5,7] = 0
evenSum [] = 0
evenSum (h:t)
	| (mod h 2) == 0 = h + (evenSum t)
	| otherwise	 = evenSum t
