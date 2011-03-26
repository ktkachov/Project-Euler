{-
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10001st prime number?
-}

main = print $ f 10000

f :: Int -> Int
f = (primes !!)

primes :: [Int]
primes = filter isPrime (2:[3,5..])

isPrime :: Int -> Bool
isPrime n = n > 1 && and [n `mod` x /= 0 | x <- [2..floor.sqrt.fromIntegral $ n]]
