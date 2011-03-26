{-
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
-}


main = print $ sumBelow 2000000

sumBelow :: Int -> Int
sumBelow n = sum $ takeWhile (<n) primes

primes :: [Int]
primes = filter isPrime (2:[3,5..])

isPrime :: Int -> Bool
isPrime n = n > 1 && and [n `mod` x /= 0 | x <- [2..floor.sqrt.fromIntegral $ n]]
