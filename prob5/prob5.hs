main = print f

f :: Integer
f = head $ dropWhile (not.isDivisible) [20,40..]
  where
    divs = map (\x n-> n `mod` x == 0) [2..20] 
    isDivisible :: Integer -> Bool
    isDivisible n = and [d n | d <- divs]
    
