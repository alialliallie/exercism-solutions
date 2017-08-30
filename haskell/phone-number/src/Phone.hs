module Phone (number) where

import Data.Char (isDigit)

number :: String -> Maybe String
number n = validExchange (validAreaCode (lastTen (validStart (validLength (Just (digits n))))))

digits :: String -> String
digits = filter isDigit

validLength :: Maybe String -> Maybe String
validLength = reject ((\x -> x < 10 || x > 11) . length)

validStart :: Maybe String -> Maybe String
validStart = reject (\x -> length x == 11 && head x /= '1')

validAreaCode :: Maybe String -> Maybe String
validAreaCode = reject ((\x -> head x < '2' || head x > '9') . areaCode)

validExchange :: Maybe String -> Maybe String
validExchange = reject ((\x -> head x < '2' || head x > '9') . exchange)

areaCode :: String -> String
areaCode = take 3

exchange :: String -> String
exchange = take 3 . drop 3

reject :: (a -> Bool) -> Maybe a -> Maybe a
reject _ Nothing = Nothing
reject f (Just a) = if f a then Nothing else Just a

lastTen :: Maybe String -> Maybe String
lastTen Nothing = Nothing
lastTen (Just x) = Just (takeRight 10 x)

takeRight :: Int -> [a] -> [a]
takeRight n xs
  | length xs == n = xs
  | length xs < n = xs
  | length xs > n = takeRight n (tail xs)
