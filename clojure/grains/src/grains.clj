(ns grains)

(defn- pow 
  "Raise a number n to exponent e. Uses BigInteger."
  [n e] 
  (.pow (BigInteger. (str n)) e))

(defn square
  "Find the number of grains on a given square."
  [n]
  (pow 2 (- n 1)))

(def square-xf (map square))

(defn total
  "Total number of grains on a chessboard."
  []
  (transduce square-xf + (range 1 65)))
