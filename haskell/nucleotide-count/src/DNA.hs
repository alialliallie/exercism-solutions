module DNA (nucleotideCounts) where

import Data.Map (Map, fromList, update)
import Data.Maybe (maybe)

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs = doCount baseCounts nucleotides
  where
    baseCounts = fromList [('A', 0), ('T', 0), ('C', 0), ('G', 0)]
    nucleotides = map newNucleotide xs

doCount :: Map Char Int -> [Either String Char] -> Either String (Map Char Int)
doCount counts [] = Right counts
doCount counts (Left s:_) = Left s
doCount counts (Right n:ns) = doCount newCounts ns
  where
    newCounts = update (Just . (+ 1)) n counts

newNucleotide :: Char -> Either String Char
newNucleotide 'A' = Right 'A'
newNucleotide 'T' = Right 'T'
newNucleotide 'C' = Right 'C'
newNucleotide 'G' = Right 'G'
newNucleotide _   = Left "Invalid nucleotide"

