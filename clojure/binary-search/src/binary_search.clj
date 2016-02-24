(ns binary-search)

(defn middle
  "Find midpoint index of coll."
  [coll]
  (quot (count coll) 2))

(defn- is-sorted?
  [coll]
  (every? #(apply < %) (partition 2 1 coll)))

(defn search-for
  [target coll]
  (assert (is-sorted? coll) "must be sorted")
  (loop [data (vec coll)
         pos 0]
    (let [mid (middle data)
          mid-val (nth data mid)]
      (when (= 1 (count data))
        (assert (= target (first data)) "not found"))
      (cond
        (= target mid-val) (+ pos mid)
        (< target mid-val) (recur (subvec data 0 mid) pos)
        (> target mid-val) (recur (subvec data mid) (+ pos mid))))))

