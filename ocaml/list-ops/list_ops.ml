let rec fold ~(init: 'acc) ~(f: 'acc -> 'a -> 'acc) xs =
  match xs with
  | [] -> init
  | x :: xs -> fold ~init:(f init x) ~f xs

let reverse xs =
  fold ~init:[] ~f:(fun acc x -> x :: acc) xs

let length xs =
  fold ~init:0 ~f:(fun acc _ -> acc + 1) xs

let append xs ys =
  fold ~init:ys ~f:(fun acc x -> x :: acc) (reverse xs)

let concat xs =
  fold ~init:[] ~f:(fun acc x -> append x acc) (reverse xs)

let filter ~(f: 'a -> bool) xs =
  reverse (fold ~init:[] ~f:(fun acc x -> if f x then x :: acc else acc) xs)

let rec map ~(f: 'a -> 'b) xs =
  match xs with
  | [] -> []
  | x :: xs -> f x :: map ~f xs


