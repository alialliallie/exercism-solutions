(ns phone-number
  (require [clojure.string :as s]))

(def invalid "0000000000")

(defn- valid?
  [phone]
  (if (= 11 (.length phone))
    (.startsWith phone "1")
    (= 10 (.length phone))))

(def not-valid? (complement valid?))

(defn- str-tail
  "Get the last n characters of a string."
  [string n]
  (let [len (.length string)]
    (.substring string (- len n))))

(defn- with-area-code?
  [number]
  (and (= (count number) 11) (.startsWith number "1")))

(defn- clean
  [phone]
  (let [digits (s/replace phone #"\D" "")]
    (if (not-valid? digits) invalid digits)))

(defn- format-number
  [num]
  (let [numbers (str-tail num 7)]
    (str (.substring numbers 0 3) "-" (str-tail numbers 4))))

(defn number
  [phone]
  (let [clean-phone (clean phone)]
    (if (with-area-code? clean-phone)
      (.substring clean-phone 1)
      clean-phone)))

(defn area-code
  [phone]
  (.substring (number phone) 0 3))

(defn pretty-print
  [phone]
  (let [n (number phone)]
    (str "(" (area-code n) ") " (format-number n))))
