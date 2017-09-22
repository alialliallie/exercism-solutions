module SecretHandshake (handshake) where

import Data.Bits

handshake :: Int -> [String]
handshake n =
  if isReverse n then
    reverse actions
  else 
    actions
  where
    actions = foldl pickAction [] (map (doAction n) codes)

pickAction :: [String] -> Maybe String -> [String]
pickAction xs (Just act) = xs ++ [act]
pickAction xs _ = xs

doAction n (bit, action) = 
  if testBit n bit then Just action else Nothing

codes = [(0, "wink"),
         (1, "double blink"), 
         (2, "close your eyes"), 
         (3, "jump")]

isReverse n = testBit n 4
