module Triangle (TriangleType(..), triangleType) where

import Data.List (nub, permutations, sort)

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Ord a, Num a) => a -> a -> a -> TriangleType
triangleType x y z
  | illogical xs = Illegal
  | sides == 1 = Equilateral
  | sides == 2 = Isosceles
  | otherwise = Scalene
  where
    xs = [x, y, z]
    sides = length $ nub xs

illogical :: (Ord a, Num a) => [a] -> Bool
illogical xs = any invalid arrangement || elem 0 xs
  where
    arrangement = permutations xs
    invalid (x:xs) = x >= sum xs

