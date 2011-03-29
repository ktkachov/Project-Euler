{-redirect input from file names.dat-}

import Data.Char
import Data.List

main
  = do
      names <- getLine
      print $ f names

f :: String -> Int
f = sum.(zipWith (*) [1..]).(map alphaValue).sort.words.myFilter

alphaValue :: String -> Int
alphaValue = sum.(map alphaOrd)

alphaOrd :: Char -> Int
alphaOrd c = succ $ ord c - ord 'A'

myFilter :: String -> String
myFilter [] = []
myFilter (x:xs)
  | x == ',' = ' ' : (myFilter xs)
  | x == '"' = myFilter xs
  | otherwise = x : (myFilter xs)
       
