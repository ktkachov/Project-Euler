import Data.List

main = print f

f = sum $ take 11 [x | x <- primes, foo x]

isPrime :: Integer -> Bool
isPrime n = (head $ dropWhile (<n) primes') == n

foo n 
  = (test digs) && (checkTails.tail.(map reverse).tails $ (reverse digs))
  where
    test = checkTails.tail.tails
    digs = digits n


checkTails :: [[Int]] -> Bool
checkTails [[]] = True
checkTails (x:xs)
  | isPrime $ fromDigs x = checkTails xs
  | otherwise = False

fromDigs :: [Int] -> Integer
fromDigs ns = read (ns >>= show)

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
primes = drop 4 primes'

primes' :: [Integer]
primes' = [2,3,5] ++ (diff [7, 9 ..] nonprimes) 

nonprimes :: [Integer]
nonprimes = foldr1 f . map g . tail $ primes'
  where 
    f (x:xt) ys = x : (merge xt ys)
    g p         = [ n * p | n <- [p, p + 2 ..]]
