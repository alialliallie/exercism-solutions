module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p = keep (not . p)

keep :: (a -> Bool) -> [a] -> [a]
keep = doKeep []

doKeep :: [a] -> (a -> Bool) -> [a] -> [a]
doKeep acc _ [] = acc
doKeep acc p (x:xs) = doKeep next p xs
  where
    next = if p x
      then acc ++ [x]
      else acc
