isPalindrome :: Int -> Bool
isPalindrome x 
  = str == reverse str
    where
      str = show x

f :: (Int, (Int, Int))
f = (maxPal, nums)
  where
    products = [(x*y, (x,y)) | x <- [100..999], y <- [100..999]]
    maxPal = maximum $ filter isPalindrome (map fst products)
    nums = lookUp maxPal products

lookUp :: Int -> [(Int, a)] -> a
lookUp k xs = snd $ head $ filter (\x -> fst x == k) xs
