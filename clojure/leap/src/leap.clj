(ns leap)

(defn- divides-by?
  [n m]
  (= 0 (mod n m)))

(defn leap-year?
  [year]
  (condp #(divides-by? %2 %1) year
    400 true
    100 false
    4   true
    false))
