(ns nucleotide-count)

(def empty-counts
  {\A 0 \T 0 \C 0 \G 0})

(defn- valid-nucleotide?
  [nucleotide]
  (empty-counts nucleotide))

(defn nucleotide-counts
  [strand]
  (merge empty-counts (frequencies (seq strand))))

(defn count
  [nucleotide strand]
  (when-not (valid-nucleotide? nucleotide)
    (throw  (Exception. "invalid nucleotide")))
  ((nucleotide-counts strand) nucleotide))
