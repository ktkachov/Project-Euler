
main = print f

f :: Int
f = sum [x | x <- [1..999999], isPalindrome x, isPalindrome $ dec2Bin x]

isPalindrome :: (Show a) => a -> Bool
isPalindrome n
  = str == reverse str
  where
    str = show n
 
dec2Bin :: Int -> String
dec2Bin 0 = "0"
dec2Bin 1 = "1"
dec2Bin n = (dec2Bin (n `div` 2)) ++ (show $ n `mod` 2)
