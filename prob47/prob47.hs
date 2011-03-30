import Data.List

main = print f

f = head [n | n <- [1..], all (==4) (map (length.nub.primeFactors) [n,n+1,n+2,n+3])]


primeFactors :: Integer -> [Integer]
primeFactors n = primeFactors' n primes 


primeFactors' :: Integer -> [Integer] -> [Integer]
primeFactors' 1 _ = []
primeFactors' n (p:ps)
  | n `mod` p == 0 = p:(primeFactors' (n `div` p) (p:ps))
  | otherwise = primeFactors' n ps

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = 
  case compare x y of
    LT -> x : (merge xt ys)
    EQ -> x : (merge xt yt)
    GT -> y : (merge xs yt)

diff :: (Ord a) => [a] -> [a] -> [a]
diff xs@(x:xt) ys@(y:yt) = 
  case compare x y of
    LT -> x : (diff xt ys)
    EQ -> diff xt yt
    GT -> diff xs yt


primes :: [Integer]
primes = [2,3,5] ++ (diff [7, 9 ..] nonprimes) 

nonprimes :: [Integer]
nonprimes = foldr1 f . map g . tail $ primes
  where 
    f (x:xt) ys = x : (merge xt ys)
    g p         = [ n * p | n <- [p, p + 2 ..]]
