module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep = doKeep []

doKeep :: [a] -> (a -> Bool) -> [a] -> [a]
doKeep acc p = foldr (\a b -> if p a then a:b else b) []

