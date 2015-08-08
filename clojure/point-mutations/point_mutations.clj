(ns point-mutations)

(defn hamming-distance
  [left right]
  (if (= (count left) (count right))
    (count (filter #(apply not= %) (map vector left right)))
    nil
    ))

