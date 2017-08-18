module Pangram (isPangram) where

import Data.List (nub)
import Data.Char (isAlpha, toLower)

isPangram :: String -> Bool
isPangram text = uniqCount == 26
  where uniqCount = length $ nub $ map toLower $ filter isAlpha text 

