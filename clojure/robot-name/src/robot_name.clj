(ns robot-name)

(defn- char-range
  [start end]
  (map char (range (int start) (+ 1 (int end)))))

(def alphabet (char-range \A \Z))

(defn- prefix
  []
  (str (rand-nth alphabet) (rand-nth alphabet)))

(defn- serial
  []
  (format "%03d" (int (rand 999))))

(defn- gen-name
  []
  (str (prefix) (serial)))

(defn robot
  []
  {:name (gen-name)})

(defn reset-name
  [bot]
  (assoc bot :name (gen-name)))

(defn robot-name
  [bot]
  (bot :name))
