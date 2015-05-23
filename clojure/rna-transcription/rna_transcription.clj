(ns rna-transcription
  (:require [clojure.set :refer [subset?]]
            [clojure.string :refer [join]]))

(def dna->rna
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn- valid-rna?
  [chain]
  (subset?
    (into #{} (seq chain))
    (into #{} (keys dna->rna))))

(defn to-rna
  [chain]
  (assert (valid-rna? chain))
  (join "" (map dna->rna (seq chain))))
