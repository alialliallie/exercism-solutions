(ns etl
  (:require [clojure.string :refer [lower-case]]))

(defn- clean
  "Format the words as required by output format"
  [words]
  (map lower-case words))

(defn- flip-values
  "Flip from single {score words} map to multiple {word score} maps."
  [values] 
  (let [[score words] values]
    (into {} (map (fn [word] {word score}) (clean words)))))

(defn transform
  [score-table]
  (into {} (map flip-values score-table)))
