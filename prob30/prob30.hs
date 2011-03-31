main = print f

f = scanl (+) 0 [x | x <- [10..], foo x]

foo :: Integer -> Bool
foo n = (==n).sum.(map (^5)).digits $ n

digits :: (Integral a) => a -> [Integer]
digits = (map (read.return)).show
