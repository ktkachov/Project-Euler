sumSquares :: Int -> Int
sumSquares n = sum $ map (^2) [1..n]

squareSum :: Int -> Int
squareSum n = (sum [1..n]) ^ 2

f = squareSum 100 - sumSquares 100
