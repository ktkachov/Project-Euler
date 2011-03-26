{-
A palindromic number reads the same both ways. The largest palindrome made
 from the product of two 2-digit numbers is 9009 = 91*99.

Find the largest palindrome made from the product of two 3-digit numbers

-}


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
