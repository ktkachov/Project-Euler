fibs :: [Integer]
fibs = scanl (+) 0 (1:fibs)

f :: Integer
f = sum $ filter even $ takeWhile (<4000000) fibs
