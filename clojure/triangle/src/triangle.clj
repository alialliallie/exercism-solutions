(ns triangle)

(defn- equilateral?
  [sides]
  (= 1 (count (distinct sides))))

(defn- isosceles?
  [sides]
  (= 2 (count (distinct sides))))

(defn- illogical?
  [[a b c]]
  (or (>= a (+ b c))
      (>= b (+ a c))
      (>= c (+ a b))))

(defn type
  [a b c]
  (condp apply [[a b c]]
    equilateral? :equilateral
    illogical?   :illogical
    isosceles?   :isosceles
    :scalene))
