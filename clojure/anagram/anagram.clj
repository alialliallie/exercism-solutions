(ns anagram
  (:require [clojure.string :as s]))

(defn- letter-count
  [word]
  (into {}
        (map (fn [[letter ls]] [letter (count ls)])
             (group-by identity 
                       (seq (s/lower-case word))))))

(defn anagrams-for
  [word candidates]
  (let [word-count (letter-count word)]
    (filter #(apply not= (map s/lower-case [word %]))
            (filter #(= word-count (letter-count %)) candidates))))
