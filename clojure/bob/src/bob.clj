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
  (condp #(%1 %2) remark
    shout? "Whoa, chill out!"
    question? "Sure."
    silence? "Fine. Be that way!"
    "Whatever."))
