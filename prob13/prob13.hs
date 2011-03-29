{-redirect output to the program from file nums.dat-}

import System.IO

main
  = do
    nums <- sequence (take 100 $ repeat getLine)
    print $ f nums


f :: [String] -> String
f = concat.(map show).(take 10).digits.sum.toIntegers


digits :: (Integral a) => a -> [Int]
digits = (map (read.return)).show

toIntegers :: [String] -> [Integer]
toIntegers = map read
