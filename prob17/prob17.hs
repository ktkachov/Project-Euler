main = print f

f = (sum $ map foo [1..1000]) + (length "onethousand")

foo n
  = hunds' + (count10s tens)
  where
    hunds' = if tens == 0 then hunds else hunds + 3
    hunds = count100s hundreds
    hundreds = n `div` 100
    tens = n `mod` 100

count100s n = if n == 0 then 0 else (lookUp n numLetts) + 7

count10s n
  = if n < 20 then lookUp n numLetts else (lookUp singles numLetts) + (lookUp (n - singles) numLetts)
  where
    singles = n `mod` 10

lookUp :: Int -> [(Int, Int)] -> Int
lookUp x xs = snd $ head $ filter (\(y, y') -> y == x) $ xs

numLetts :: [(Int, Int)]
numLetts
  = (0,0):(zip ([1..20] ++ [30, 40..100]) wordsLs)
  where
    wordsLs = map length ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "hundred"]
