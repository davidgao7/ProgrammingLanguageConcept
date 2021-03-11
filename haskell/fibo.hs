



fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = (fib (n-1)) + (fib (n-2))

fibTuple :: (Integer,Integer,Integer) -> (Integer,Integer,Integer)
-- fibTuple (fibN,fib(N+1),N)
fibTuple (a,b,0) = (a,b,0)
fibTuple (a,b,n) = (d,(c+d),n)
	 where (c,d,e) = fibTuple (a,b,(n-1))

fastFib :: Integer -> Integer
fastFib n = getFirst (fibTuple (0,1,n))

getFirst :: (a,a,a) -> a
getFirst (x,_,_) = x