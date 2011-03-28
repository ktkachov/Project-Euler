import Data.List

main = print f

f :: Maybe Int
f = let xs = map foo [1..10^6] in (elemIndex (maximum xs) (0:0:xs))

coPrime :: (Integral a) => a -> a -> Bool
coPrime x y = (==) 1 $ gcd x y 


foo :: (Integral a) => a -> Float
foo = \x -> (fromIntegral x) / (fromIntegral.phi $ x)

phi :: (Integral a) => a -> Int
phi n = length $ filter (coPrime n) [1..n-1]
