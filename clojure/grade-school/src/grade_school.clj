(ns grade-school)

(defn add
  [db name grade]
  (let [g (get db grade [])]
    (assoc-in db [grade] (conj g name))))

(defn grade
  [db grade]
  (get db grade []))

(defn sorted
  [db]
  (into {} (sort (map (fn [[k v]] [k (sort v)]) db))))

