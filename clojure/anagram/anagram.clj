(ns anagram
  (:require [clojure.string :as s]))

(defn- anagram?
  [word candidate]
  (let [w (s/lower-case word)
        c (s/lower-case candidate)]
    (and (not= w c)
         (= (sort w) (sort c)))))

(defn anagrams-for
  [word candidates]
    (filter (partial anagram? word) candidates))
