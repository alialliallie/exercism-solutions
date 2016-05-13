(ns robot-name)

(defn- char-range
  [start end]
  (map char (range (int start) (+ 1 (int end)))))

(def alphabet (char-range \A \Z))

(def used-names (atom #{}))

(defn- prefix
  []
  (str (rand-nth alphabet) (rand-nth alphabet)))

(defn- serial
  []
  (format "%03d" (int (rand 999))))

(defn- gen-name
  []
  (str (prefix) (serial)))

(defn- unique-name
  []
  (loop [new-name (gen-name)]
    (if (@used-names new-name)
      (recur (gen-name))
      (do
        (swap! used-names conj new-name)
        new-name))))

(defn robot
  []
  {:name (unique-name)})

(defn reset-name
  [bot]
  (assoc bot :name (unique-name)))

(defn robot-name
  [bot]
  (bot :name))
