{-
It can be seen that the number, 125874, and its double, 251748,
contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
-}

import Data.List

main = print f

f = head $ dropWhile (\x -> not $ all ((== (sort.digits) x).sort.digits) ((map (x*)) [2..6])) [1..]

digits :: Int -> [Int]
digits = (map (read.return)).show
