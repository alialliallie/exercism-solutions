module Bob (responseFor) where

import Data.Char as Char

hasAlpha :: String -> Bool
hasAlpha remark = any Char.isAlpha remark

shouting :: String -> Bool
shouting remark = 
    remark == upper && (hasAlpha remark)
    where upper = map Char.toUpper remark

question :: String -> Bool
question remark = (last remark) == '?'

silent :: String -> Bool
silent remark = all Char.isSpace remark

trim :: String -> String
trim = f . f
  where f = reverse . dropWhile Char.isSpace

responseFor :: String -> String
responseFor remark 
  | silent r = "Fine. Be that way!"
  | shouting r = "Whoa, chill out!"
  | question r = "Sure."
  | otherwise  = "Whatever."
  where r = trim remark

