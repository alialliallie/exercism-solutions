(ns meetup
  (:require [clj-time.core :as t]))

(def weekdays {:monday 1
               :tuesday 2
               :wednesday 3
               :thursday 4
               :friday 5
               :saturday 6
               :sunday 7})

(defn teenth-day
  [month year weekday]
  (let [weekday-num (weekdays weekday)
        start (t/date-time year month 13)
        days (take 7 (iterate #(t/plus % (t/days 1)) start))]
    (first (filter #(= (t/day-of-week %) weekday-num) days))))

(defn detect-weekday
  [weekday-num start]
  (let [days (take 7 (iterate #(t/plus % (t/days 1)) start))]
    (first (filter #(= (t/day-of-week %) weekday-num) days))))

(defn first-day
  [month year weekday]
  (detect-weekday (weekdays weekday)
                  (t/date-time year month 1)))

(defn nth-day
  [n month year weekday]
  (let [first-weekday (first-day month year weekday)]
    (t/plus first-weekday (t/days (* 7 (- n 1))))))

(defn last-day
  [month year weekday]
  (let [weekday-num (weekdays weekday)
        start (t/last-day-of-the-month year month)
        days (take 7 (iterate #(t/plus % (t/days -1)) start))]
    (first (filter #(= (t/day-of-week %) weekday-num) days))))

(defn date->vector
  [date]
  [(t/year date) (t/month date) (t/day date)])

(defn meetup
  [month year weekday occurrance]
  (let [date-time (case occurrance
                    :teenth (teenth-day month year weekday)
                    :first (nth-day 1 month year weekday)
                    :second (nth-day 2 month year weekday)
                    :third (nth-day 3 month year weekday)
                    :fourth (nth-day 4 month year weekday)
                    :last (last-day month year weekday))]
    (date->vector date-time)))
