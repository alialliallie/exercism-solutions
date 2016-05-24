(ns scrabble-score)

(def raw-score {["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]      1
                ["D", "G"                        ]      2
                ["B", "C", "M", "P"                  ]      3
                ["F", "H", "V", "W", "Y"               ]      4
                ["K"                           ]      5
                ["J", "X"                        ]      8
                ["Q", "Z"                       ]      10 })


;; this is terribly named things that worked in the repl
(def score 
  (into {} (apply concat 
                  (reduce-kv 
                    (fn [a k v] 
                      (conj a (reduce 
                                (fn [ac kk]
                                  (conj ac [kk v])) [] k)))
                    [] raw-score))))



(defn score-letter
  [letter]
  (score (clojure.string/upper-case letter)))

(defn score-word
  [word]
  (reduce + 0 (map score-letter word)))
