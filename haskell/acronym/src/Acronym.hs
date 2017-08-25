module Acronym (abbreviate) where

import Data.List.Split (splitOneOf)
import Data.Char (toUpper, isUpper, isLower)

abbreviate :: String -> String
abbreviate xs = splitOneOf " -" xs >>= (map toUpper . pluck)

pluck :: String -> String
pluck (c:cs) 
  | any isUpper cs && any isLower cs = c : filter isUpper cs
  | otherwise = [c]

