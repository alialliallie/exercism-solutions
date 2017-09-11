module Garden
    ( Plant (..)
    , defaultGarden
    , garden
    , lookupPlants
    ) where

import Data.Map (Map, empty)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

defaultGarden :: String -> Map String [Plant]
defaultGarden plants = empty

garden :: [String] -> String -> Map String [Plant]
garden students plants = empty

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants student garden = empty

newPlant :: Char -> Plant
newPlant 'C' = Clover
newPlant 'G' = Grass
newPlant 'R' = Radishes
newPlant 'V' = Violets

