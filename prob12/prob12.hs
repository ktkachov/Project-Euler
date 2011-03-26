
main = print f

triangleNum :: Int -> Int
triangleNum n = foldl (+) 1 [2..n]

factors :: Int -> [Int]
factors n = [x | x <- [1..n `div` 2], n `mod` x == 0] ++ [n]

f :: Int
f = fst $ head $ filter (\(x,xs) -> length xs >= 500) [(x, factors x)| x <- map triangleNum [1..]]
