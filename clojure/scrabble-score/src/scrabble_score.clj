(ns scrabble-score)

(def raw-score {"AEIOULNRST" 1
                "DG"         2
                "BCMP"       3
                "FHVWY"      4
                "K"          5
                "JX"         8
                "QZ"         10})


(def score
  (into {} (for [[letters score] raw-score
                 letter letters]
            [letter score])))

(defn score-letter
  [letter]
  (score (clojure.string/upper-case letter)))

(defn score-word
  [word]
  (reduce + 0 (map score-letter word)))
