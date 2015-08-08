(ns rna-transcription)

(def dna->rna
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn- valid-rna?
  [chain]
  (every? #(dna->rna %) (seq chain)))

(defn to-rna
  [chain]
  (assert (valid-rna? chain))
  (apply str (map dna->rna (seq chain))))
