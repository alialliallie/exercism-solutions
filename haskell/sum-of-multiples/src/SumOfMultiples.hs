module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum $ filter (hasFactors factors) [1 .. limit - 1]

hasFactors :: [Integer] -> Integer -> Bool
hasFactors factors n = any (\f -> n `mod` f == 0) factors
