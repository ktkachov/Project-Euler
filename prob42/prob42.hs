import Data.Char

main = do
    ws'' <- getLine
    ws' <- return $ "[" ++ ws'' ++ "]"
    ws <- return $ getList ws'
    print $ f ws


f :: [String] -> Int
f = length.(filter isTriangleWord)

isTriangleWord :: String -> Bool
isTriangleWord = isTriangleNum.wordValue

isTriangleNum :: Integer -> Bool
isTriangleNum n = (==n).head $ dropWhile (<n) triangleNums

triangleNums :: [Integer]
triangleNums = map (\n -> n * (succ n) `div` 2) [1..]

getList :: String -> [String]
getList = read

wordValue :: String -> Integer
wordValue = sum.(map alphaValue)

alphaValue :: Char -> Integer
alphaValue c = toInteger $ succ $ ord c - ord 'A'
