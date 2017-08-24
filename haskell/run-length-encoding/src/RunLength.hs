module RunLength (decode, encode) where

import Data.List (span)
import Data.Char (isDigit)

decode :: String -> String
decode = doDecode ""

doDecode :: String -> String -> String
doDecode out "" = out
doDecode out enc =
    case count of
        [] -> doDecode (out ++ [c]) next
        [(n, _)] -> doDecode (out ++ expand n c) next
    where 
        (countStr, rest) = span isDigit enc
        count = reads countStr :: [(Int, String)]
        c : next = rest

expand :: Int -> Char -> String
expand count c = map (const c) [1..count] 

encode :: String -> String
encode = doEncode ""

doEncode :: String -> String -> String
doEncode out "" = out
doEncode out (head:rest) =
    case span (== head) (head:rest) of
        ("", "") -> out
        (prefix, suffix) -> doEncode (append out prefix) suffix

append out [c] = out ++ [c]
append out (c:cs) = 
    out ++ addition
    where addition = show (length (c:cs)) ++ [c] 
