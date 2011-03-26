{-
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
-}

main = print $ f 600851475143

primeFactors :: Integer -> [Integer]
primeFactors n = filter (\x -> n `mod` x == 0) (filter isPrime [2..floor.sqrt.fromIntegral $ n])


isPrime :: Integer -> Bool
isPrime n = n > 1 && and [n `mod` x /= 0 | x <- [2..floor.sqrt.fromIntegral $ n]]

f :: Integer -> Integer
f n = maximum $ primeFactors n
