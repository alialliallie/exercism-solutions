(ns leap)

(defn- divides-by?
  [n m]
  (= 0 (mod n m)))

(defn leap-year?
  [year]
  (cond
    (divides-by? year 400) true
    (divides-by? year 100) false
    (divides-by? year 4) true
    :else false))