{-
 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

 What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-}

main = print f

f :: Integer
f = head $ dropWhile (not.isDivisible) [20,40..]
  where
    divs = map (\x n-> n `mod` x == 0) [2..20] 
    isDivisible :: Integer -> Bool
    isDivisible n = and [d n | d <- divs]
    
