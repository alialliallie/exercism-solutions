-module(difference_of_squares).
-export([sum_of_squares/1, square_of_sums/1, difference_of_squares/1]).

square(N) -> trunc(N * N).

sum_of_squares(N) ->
    Squares = lists:map(fun square/1, lists:seq(1, N)),
    lists:foldl(fun (S, Sum) -> S + Sum end, 0, Squares).

square_of_sums(N) ->
    Sum = (N * (N + 1)) / 2,
	square(Sum).

difference_of_squares(N) ->
    square_of_sums(N) - sum_of_squares(N).
