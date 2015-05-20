(ns bob
  (:require [clojure.string :as string]))

(defn- shout?
  [remark]
  (and
    (= (string/upper-case remark) remark)
    (not= (string/lower-case remark) remark)))

(defn- question?
  [remark]
  (.endsWith remark "?"))

(defn- silence?
  [remark]
  (string/blank? remark))

(defn response-for
  [remark]
  (cond
    (shout? remark) "Whoa, chill out!"
    (question? remark) "Sure."
    (silence? remark) "Fine. Be that way!"
    :else "Whatever."))
