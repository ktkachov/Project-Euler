
main = print f

f :: Integer
f = sum [1 | n <- [1..100], r <- [1..n-1], n `choose` r > 10^6]

choose :: Integer -> Integer -> Integer
choose n r
  = ((product [n-r+1..n])) `div` (fact r)

factlist :: [Integer]
factlist = 1 : (zipWith (*) [1..] factlist)

fact :: Integer -> Integer
fact n = factlist !! (fromInteger n)
