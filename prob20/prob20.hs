{-
n! means n  (n  1)  ...  3  2  1

For example, 10! = 10  9  ...  3  2  1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
-}

main = print f

f = sum $ digits $ fact 100

facs :: [Integer]
facs = scanl (*) 1 [1..]

fact :: Int -> Integer
fact n = facs !! n

digits :: Integer -> [Int]
digits n = map (read.return) (show n)
