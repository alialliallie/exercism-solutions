module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Location = Location Integer Integer
  deriving (Eq, Show)

data Robot = Robot Location Bearing
  deriving (Show)

bearing :: Robot -> Bearing
bearing (Robot _ bearing) = bearing

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot (Location x y) _) = (x, y)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot direction (x, y) = Robot (Location x y) direction

simulate :: Robot -> String -> Robot
simulate = foldl run

run :: Robot -> Char -> Robot
run (Robot loc heading) 'R' = Robot loc (turnRight heading)
run (Robot loc heading) 'L' = Robot loc (turnLeft heading)
run r 'A' = advance r

advance :: Robot -> Robot
advance (Robot (Location x y) North) = Robot (Location x (y+1)) North
advance (Robot (Location x y) South) = Robot (Location x (y-1)) South
advance (Robot (Location x y) East) = Robot (Location (x+1) y) East
advance (Robot (Location x y) West) = Robot (Location (x-1) y) West

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft East  = North
turnLeft South = East
turnLeft West  = South

turnRight :: Bearing -> Bearing
turnRight North = East
turnRight East  = South
turnRight South = West
turnRight West  = North
