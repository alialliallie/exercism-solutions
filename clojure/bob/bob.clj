(ns bob
  (:require [clojure.string :as str]))

(defn shout
  [remark]
  (and
    (= (str/upper-case remark) remark)
    (re-find #"[a-zA-Z]" remark)))

(defn question
  [remark]
  (re-find #"\?$" remark))

(defn silence
  [remark]
  (not (re-find #"\S" remark)))

(defn response-for
  [remark]
  (cond
    (shout remark) "Whoa, chill out!"
    (question remark) "Sure."
    (silence remark) "Fine. Be that way!"
    :else "Whatever."))
