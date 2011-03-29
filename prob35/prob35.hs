
main = print f

f = length $ filter foo $ takeWhile (<10^6) primes

foo :: Integer -> Bool
foo = (all isPrime).rotations.show

isPrime :: Integer -> Bool
isPrime n = (head $ dropWhile (<n) primes) == n

rotations :: String -> [Integer]
rotations xs = (map read) $ rotate (length xs) xs

rotate :: Int -> String -> [String]
rotate 1 (x:xs) = [xs ++ [x]]
rotate n (x:xs)  
  = rot:(rotate (pred n) rot)
  where
    rot = xs ++ [x]

digits :: (Integral a) => a -> [Int]
digits =(map (read.return)).show

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs@(x:xt) ys@(y:yt) = 
  case compare x y of
    LT -> x : (merge xt ys)
    EQ -> x : (merge xt yt)
    GT -> y : (merge xs yt)

diff :: (Ord a) => [a] -> [a] -> [a]
diff xs@(x:xt) ys@(y:yt) = 
  case compare x y of
    LT -> x : (diff xt ys)
    EQ -> diff xt yt
    GT -> diff xs yt


primes :: [Integer]
primes = [2,3,5] ++ (diff [7, 9 ..] nonprimes) 

nonprimes :: [Integer]
nonprimes = foldr1 f . map g . tail $ primes
  where 
    f (x:xt) ys = x : (merge xt ys)
    g p         = [ n * p | n <- [p, p + 2 ..]]


