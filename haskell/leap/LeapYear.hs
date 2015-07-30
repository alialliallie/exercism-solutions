module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear (y)
  | divisible 400 = True
  | divisible 100 = False
  | divisible 4   = True
  | otherwise     = False
  where divisible x = y `mod` x == 0

