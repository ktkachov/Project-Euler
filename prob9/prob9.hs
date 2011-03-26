main = print f

f :: Int
f = head [a*b*c | (a,b,c) <- ordered, a + b + c == 1000 && a*a + b*b == c*c]

ordered = filter isOrdered [(a,b,c) | a <- [1..1000], b <- [1..1000], c <- [1..1000]]

isOrdered :: (Int, Int, Int) -> Bool
isOrdered (x,y,z) = x < y && y < z
