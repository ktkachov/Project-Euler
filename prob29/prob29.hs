import Data.List

main = print f

f = length $ nub [a^b | a <- [2..100], b <- [2..100]]
