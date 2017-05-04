module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

earthSeconds = 31557600

ageOn :: Planet -> Float -> Float
ageOn planet seconds =
  case planet of
    Mercury -> relativeAge 0.2408467 seconds
    Venus -> relativeAge 0.61519726 seconds
    Earth -> relativeAge 1 seconds
    Mars -> relativeAge 1.8808158 seconds
    Jupiter -> relativeAge 11.862615 seconds
    Saturn -> relativeAge 29.447598 seconds
    Uranus -> relativeAge 84.016846 seconds
    Neptune -> relativeAge 164.79132 seconds

relativeAge :: Float -> Float -> Float
relativeAge ratio seconds =
    (seconds / earthSeconds) / ratio
