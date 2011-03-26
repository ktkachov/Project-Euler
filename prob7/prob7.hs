
f :: Integer
f = primes !! 1000

primes :: [Integer]
primes = filter isPrime (2:[3,5..])

isPrime :: Integer -> Bool
isPrime n = n > 1 && and [n `mod` x /= 0 | x <- [2..floor.sqrt.fromIntegral $ n]]
