module School (School, add, empty, grade, sorted) where

import qualified Data.List as L
import qualified Data.Map as M
import Data.Maybe (fromMaybe)

type School = M.Map Int [String]

add :: Int -> String -> School -> School
add gradeNum student = M.alter (addStudent student) gradeNum

addStudent :: String -> Maybe [String] -> Maybe [String]
addStudent student Nothing = Just [student]
addStudent student (Just peers) = Just $ L.sort (peers ++ [student])

empty :: School
empty = M.empty

grade :: Int -> School -> [String]
grade = M.findWithDefault []

sorted :: School -> [(Int, [String])]
sorted = M.toAscList

