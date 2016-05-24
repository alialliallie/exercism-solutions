(ns scrabble-score)

(def raw-score {"AEIOULNRST" 1
                "DG"         2
                "BCMP"       3
                "FHVWY"      4
                "K"          5
                "JX"         8
                "QZ"         10})


(defn- accumulate-pairs
  "Convert letters and score into [letter score] pairs and accumulate."
  [pairs letters score] 
  (conj pairs (reduce 
                (fn [a letter] (conj a [letter score])) 
                [] 
                letters)))

(def score 
  (into {} (apply concat (reduce-kv accumulate-pairs [] raw-score))))

(defn score-letter
  [letter]
  (score (clojure.string/upper-case letter)))

(defn score-word
  [word]
  (reduce + 0 (map score-letter word)))
