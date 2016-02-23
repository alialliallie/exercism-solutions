(ns phone-number
  (require [clojure.string :as s]))

(def invalid "0000000000")

(defn- with-area-code?
  [num]
  (and (= (count num) 11) (= \1 (first num))))

(defn number
  [phone]
  (let [num (s/replace phone #"\D" "")]
    (cond
      (with-area-code? num) (apply str (rest num))
      (not= (count num) 10) invalid
      :else num)))

(defn area-code
  [phone]
  (apply str (take 3 (number phone))))

(defn- format-number
  [num]
  (let [numbers (take-last 7 num)]
    (str (apply str (take 3 numbers))
         "-" (apply str (take-last 4 numbers)))))

(defn pretty-print
  [phone]
  (str "(" (area-code phone)") "
       (format-number (number phone))))
