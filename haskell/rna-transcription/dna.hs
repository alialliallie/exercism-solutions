module DNA (toRNA) where

toRNA :: [Char] -> [Char]
toRNA x = map subNucleotide x
  where subNucleotide n = case (n) of 
          ('G') -> 'C'
          ('C') -> 'G'
          ('T') -> 'A'
          ('A') -> 'U'
          _     -> 'X'

