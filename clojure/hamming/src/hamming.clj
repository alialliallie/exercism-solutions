(ns hamming)

(defn distance
  [strand-a strand-b]
  (when (= (count strand-a) (count strand-b))
    (count (filter not (map = strand-a strand-b)))))
