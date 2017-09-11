module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, fromList, (!))
import Data.List (sort)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

defaultStudents = ["Alice", "Bob", "Charlie", "David",
 "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

defaultGarden :: String -> Map String [Plant]
defaultGarden = garden defaultStudents

garden :: [String] -> String -> Map String [Plant]
garden students plants = fromList $ zip (sort students) planters
  where 
    planters = parseGarden plants

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants student garden = garden ! student

parseGarden :: String -> [[Plant]]
parseGarden g = zipWith (++) (head boxes) (last boxes)
  where
    boxes = map (slice 2 . parseRow) $ lines g

parseRow :: String -> [Plant]
parseRow = map newPlant

newPlant :: Char -> Plant
newPlant 'C' = Clover
newPlant 'G' = Grass
newPlant 'R' = Radishes
newPlant 'V' = Violets

slice :: Int -> [a] -> [[a]]
slice _ [] = []
slice n xs = take n xs : slice n (drop n xs)
