module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz = doCollatz 0

doCollatz :: Integer -> Integer -> Maybe Integer
doCollatz count n
  | n < 1     = Nothing
  | n == 1    = Just count
  | otherwise = doCollatz (count + 1) (step n)

step :: Integer -> Integer
step n
  | even n = n `div` 2
  | odd n  = (n * 3) + 1
