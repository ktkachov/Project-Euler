import Data.List

main = print f

f = head $ filter isPrime pans

pans :: [Integer]
pans = filter odd $ (map (read.(>>= show))).reverse.sort.permutations $ [1..7]


isPrime n = odd n && all (\y -> n `mod` y /= 0) [x | x <- [3..floor.sqrt.fromIntegral $ n], odd x]

