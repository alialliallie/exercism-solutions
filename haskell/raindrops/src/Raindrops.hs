module Raindrops (convert) where

import qualified Data.Map as M

factorWords n =
  M.elems (M.filterWithKey (\k _ -> n `mod` k == 0) words)
  where 
    words = M.fromList [ (3, "Pling"), (5, "Plang"), (7, "Plong") ]

convert :: Int -> String
convert n = 
  case factorWords n of 
    [] -> show n
    ws -> foldl1 (++) ws
