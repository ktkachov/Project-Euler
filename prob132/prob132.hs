{-
A number consisting entirely of ones is called a repunit. We shall define R(k) to be a repunit of length k.

For example, R(10) = 1111111111 = 11*41*271*9091, and the sum of these prime factors is 9414.

Find the sum of the first forty prime factors of R(10^9)
-}


--Currently runs out of memory :(

main = print f

f = take 40 $ primeFactors $ r (10^9)

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes
  where factor n (p:ps) | p*p > n = [n]
                        | n `mod` p /= 0 = factor n ps
                        | otherwise = p : factor (n `div` p) (p:ps)
        primes = 2 : filter ((==1) . length . primeFactors) [3,5..]

r :: Int -> Integer
r n = read $ replicate n '1'
