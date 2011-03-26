{-
The 5-digit number, 16807=75, is also a fifth power. 
Similarly, the 9-digit number, 134217728=89, is a ninth power.
How many n-digit positive integers exist which are also an nth power?
-}

{-
I have not really solved it... just a test to check how many numbers in
a given number length pass the test
-}

main = print $ f 5

f :: Int -> Int
f n 
  = length $ filter theTest [10^(n-1)..10^n -1]
  where
    theTest :: Integer -> Bool
    theTest num 
      =  (round (fromIntegral num ** (1/fromIntegral n))) ^ n == num
{-
digits :: Integer -> [Int]
digits n = map read (map return (show n))
-}
