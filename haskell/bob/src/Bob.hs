module Bob (responseFor) where

import qualified Data.Char as C
import qualified Data.Text as T

shouting :: T.Text -> Bool
shouting remark = 
  remark == (T.toUpper remark) && (hasAlpha remark)
  where hasAlpha = T.any C.isAlpha

question :: T.Text -> Bool
question = (== '?') . T.last

silent :: T.Text -> Bool
silent = T.all C.isSpace

responseFor :: String -> String
responseFor remark 
  | silent r = "Fine. Be that way!"
  | shouting r = "Whoa, chill out!"
  | question r = "Sure."
  | otherwise  = "Whatever."
  where r = T.strip (T.pack remark)

