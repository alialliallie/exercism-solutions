module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys 
  | length xs /= length ys = Nothing
  | otherwise = Just (length $ filter pairDiff pairs)
  where 
    pairs = zip xs ys
    pairDiff = uncurry (/=)


    
