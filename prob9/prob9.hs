{-
A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

a^2 + b^2 = c^2
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
-}

main = print f

f :: Int
f = head [a*b*c | (a,b,c) <- ordered, a + b + c == 1000 && a*a + b*b == c*c]

ordered = filter isOrdered [(a,b,c) | a <- [1..1000], b <- [1..1000], c <- [1..1000]]

isOrdered :: (Int, Int, Int) -> Bool
isOrdered (x,y,z) = x < y && y < z
