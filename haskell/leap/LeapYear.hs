module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear (y)
  | mod y 400 == 0 = True
  | mod y 4 == 0 && mod y 100 > 0 = True
  | otherwise =  False

