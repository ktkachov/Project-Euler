{-
Let's call S the (infinite) string that is made by concatenating the consecutive positive integers (starting from 1) written down in base 10.
Thus, S = 1234567891011121314151617181920212223242...

It's easy to see that any number will show up an infinite number of times in S.

Let's call f(n) the starting position of the nth occurrence of n in S.
For example, f(1)=1, f(5)=81, f(12)=271 and f(7780)=111111365.

Find f(3^k) for 1 <= k <= 13.
-}

{-
 Runs out of memory for large numbers :(
-}

import Data.List

main = print fun

fun = sum [f (3^k)| k <- [1..13]]

f :: Int -> Int
f n = ((findIndices ((show n) `isPrefixOf`) (tails $ s)) !! (n-1)) + 1 
-- +1 because lists are indexed from 0

s :: String
s = [1..] >>= show
