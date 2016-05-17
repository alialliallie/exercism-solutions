(ns gigasecond
  (:require [clj-time.core :as t]))

(def giga 1000000000N)

(defn date->vector
  [date]
  [(t/year date) (t/month date) (t/day date)])

(defn from
  "Adds a gigasecond to the given date."
  [year month date]
  (-> (t/date-time year month date)
      (t/plus (t/seconds giga))
      date->vector))

