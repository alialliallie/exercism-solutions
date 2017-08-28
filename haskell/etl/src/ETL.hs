module ETL (transform) where

import Data.Map (Map, fromList, assocs)
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform legacyData = fromList scorePairs
  where 
    scorePairs = concatMap transformWords $ assocs legacyData

transformWords :: (a, String) -> [(Char, a)]
transformWords (score, letters) = map (\c -> (toLower c, score)) letters
