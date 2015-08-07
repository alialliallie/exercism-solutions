(ns word-count
  (:refer-clojure :exclude [replace])
  (:require [clojure.string :refer [split lower-case replace blank?]]))

(defn- not-blank?
  [s]
  (not (blank? s)))

(defn- prepare
  [s]
  (filter not-blank?
          (map #(replace % #"\W+$" "")
               (split (lower-case s) #" "))))

(defn word-count
  [phrase]
  (let [words (prepare phrase)]
    (frequencies words)))
