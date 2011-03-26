{-
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
-}

main = print f

f :: Int
f = sum [x | x <- [1..999999], isPalindrome x, isPalindrome $ dec2Bin x]

isPalindrome :: (Show a) => a -> Bool
isPalindrome n
  = str == reverse str
  where
    str = show n
 
dec2Bin :: Int -> String
dec2Bin n 
  | n < 2 = show n
  | otherwise = (dec2Bin (n `div` 2)) ++ (show $ n `mod` 2)
