(ns anagram
  (:require [clojure.string :as s]))

(defn- letter-count
  [word]
  (frequencies (seq (s/lower-case word))))

(defn- anagram?
  [word candidate]
  (let [w (s/lower-case word)
        c (s/lower-case candidate)]
    (and (not= w c)
         (= (letter-count w) (letter-count c)))))

(defn anagrams-for
  [word candidates]
  (let [word-count (letter-count word)]
    (filter (partial anagram? word) candidates)))
