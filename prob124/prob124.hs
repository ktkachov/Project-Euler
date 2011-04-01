import Data.List

main = print f

f = (sort [(product $ primeFactors x, x) | x <- [1..10^5]]) !! 9999

primeFactors :: Integer -> [Integer]
primeFactors n 
  | isPrime n = [n]
  | otherwise = filter (\x -> n `mod` x == 0) $ takeWhile (<=n `div` 2) primes

isPrime n = ((==n).head.dropWhile (<n)) primes

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
