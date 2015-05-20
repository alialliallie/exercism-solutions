(ns rna-transcription
  (:require [clojure.set :refer [subset?]]
            [clojure.string :refer [join]]))

(def dna->rna
  {"G" "C"
   "T" "A"
   "A" "U"
   "C" "G"})

(defn- char-seq
  [s]
  (map str (seq s)))

(defn- valid-rna?
  [chain]
  (subset?
    (into #{} (char-seq chain))
    (into #{} (keys dna->rna))))

(defn to-rna
  [chain]
  (do
    (assert (valid-rna? chain))
    (join "" (map dna->rna (char-seq chain)))))
