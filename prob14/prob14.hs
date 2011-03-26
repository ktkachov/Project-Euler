{-
The following iterative sequence is defined for the set of positive integers:

n  n/2 (n is even)
n  3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13  40  20  10  5  16  8  4  2  1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
 Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
-}

main = print f

f =  findMax [(x, (length.iterSequence) x) | x <- [2..1000000]]

findMax :: [(Int, Int)] -> Int
findMax xs = findMax' xs (0,0)

findMax' :: [(Int, Int)] ->(Int, Int) -> Int
findMax' [(x,l)] (x',l') = if l > l' then x else x'
findMax' ((x,l):xs) (x',l') = if l > l' then findMax' xs (x,l) else findMax' xs (x', l')


iterSequence :: Int -> [Int]
iterSequence n = (takeWhile (/=1) (iterate fun n)) ++ [1]

fun :: Int -> Int
fun n
  | even n = n `div` 2
  | otherwise = 3*n + 1
