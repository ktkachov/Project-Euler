{-
A number consisting entirely of ones is called a repunit. We shall define R(k) to be a repunit of length k.

For example, R(10) = 1111111111 = 11*41*271*9091, and the sum of these prime factors is 9414.

Find the sum of the first forty prime factors of R(10^9)
-}


--primes taken from literateprograms.org

main = print $ f (10^9)

f n = sum $ take 40 $ primeFactors $ repUnit n

repUnit :: Int -> Integer
repUnit n = read $ take n $ repeat '1'

primeFactors :: Integer -> [Integer]
primeFactors n = [x | x <- takeWhile (< (floor.sqrt.fromIntegral $ n)) primes, n `mod` x == 0]

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
primes    = [2, 3, 5] ++ (diff [7, 9 ..] nonprimes) 

nonprimes :: [Integer]
nonprimes = foldr1 f . map g . tail $ primes
  where 
    f (x:xt) ys = x : (merge xt ys)
    g p         = [ n * p | n <- [p, p + 2 ..]]
