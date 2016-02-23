(ns beer-song
  (:refer-clojure)
  (:require [clojure.string :as s]))

(defn- bottle [n]
  (condp = n
    0 "No more bottles"
    1 "1 bottle"
    (str n " bottles")))

(def empty-verse
  "Go to the store and buy some more, 99 bottles of beer on the wall.")

(def single-verse
  "Take it down and pass it around, no more bottles of beer on the wall.")

(defn- verse-head
  [n]
  (str (bottle n) " of beer on the wall, "
       (s/lower-case (bottle n)) " of beer."))

(defn- verse-tail
  [n]
  (condp = n
    0 empty-verse
    1 single-verse
    (str "Take one down and pass it around, "
         (bottle (- n 1)) " of beer on the wall.")))

(defn verse
  [n]
  (str (verse-head n) "\n" (verse-tail n) "\n"))

(defn sing
  ([start end]
   (s/join "\n" (map verse (range start (dec end) -1))))
  ([start]
   (sing start 0)))
