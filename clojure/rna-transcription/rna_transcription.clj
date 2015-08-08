(ns rna-transcription)

(def dna->rna
  {\G \C
   \T \A
   \A \U
   \C \G})

(defn- valid-dna?
  [dna]
  (every? #(dna->rna %) dna))

(defn to-rna
  [chain]
  (let [dna (seq chain)]
    (assert (valid-dna? dna))
    (apply str (map dna->rna dna))))
