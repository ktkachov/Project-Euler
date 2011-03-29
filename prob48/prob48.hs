
main = print f

f = (drop (length ls - 10) ls) >>= show
   where
     ls = digits $ sum [pow n n | n <- [1..1000]]

digits :: (Integral a) => a -> [Int]
digits = (map (read.return)).show

pow :: Integer -> Integer -> Integer
pow base 1 = base
pow base exponent
  | even exponent = base' * base'
  | otherwise = base * base' * base'
  where
    base' = pow base (exponent `div` 2)

