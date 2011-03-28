
main = print f

f = sum.digits $ pow2 1000

pow2 :: Int -> Integer
pow2 1 = 2
pow2 n
  | even n = n' * n'
  | otherwise = 2 * n' * n'
  where
    n' = pow2 (n `div` 2)

digits :: (Integral a) => a -> [Int]
digits = (map (read.return)).show
