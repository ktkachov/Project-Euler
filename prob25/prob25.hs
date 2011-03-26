{-
What is the first term in the Fibonacci sequence to contain 1000 digits?
-}
--Used HaskellWiki for the fast fibonacci function

main = print f

f = fst $ head $ dropWhile (\(a,x) -> (length $ digits x) < 1000) $ map (\x -> (x, fib x)) [1..]

fib n = fst $ fib2 (n-1)
 
-- | Return (fib n, fib (n + 1))
fib2 0 = (1, 1)
fib2 1 = (1, 2)
fib2 n
 | even n    = (a*a + b*b, c*c - a*a)
 | otherwise = (c*c - a*a, b*b + c*c)
 where (a,b) = fib2 (n `div` 2 - 1)
       c     = a + b

digits :: Integer -> [Int]
digits n = map read $ map return (show n)
